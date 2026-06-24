message(1) MsgTest {
    foo: Int;
}

contract MsgAsVar {
    msgval: MsgTest = MsgTest{foo: 123};
    init() {}
}