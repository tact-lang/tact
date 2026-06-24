struct StateArg {
    value: Int;
}

struct MyState {
    result: Int;
}

contract StateTest {
    receive() {}
    
    get fun getState(x: Int, arg: StateArg): MyState {
        return MyState { result: x + arg.value };
    }
}
