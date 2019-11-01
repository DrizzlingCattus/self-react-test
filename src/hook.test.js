import React from 'react';
import { mount, configure } from 'enzyme';
import HookCounter from '../src/hook.js';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

class Temp extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (<HookCounter/>);
    }
}
describe('<HookCounter/>', () => {
    test('increases', () => {
        const wrapper = mount(<HookCounter/>, { context: { foo: 10 }});
        let plusButton = wrapper.findWhere(node => {
            return node.type() === 'button' && node.text() === '+1'
        });
        plusButton.simulate('click');
        plusButton.simulate('click');

        //console.log(wrapper.context('foo'));
        //console.log(wrapper.state());
        console.log('hello');
        const number = wrapper.find('h2');

        expect(number.text()).toBe('2');
    });
});

