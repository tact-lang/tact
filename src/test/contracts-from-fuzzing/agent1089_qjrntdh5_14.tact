message(101) MsgTest {
    foo: Int;
}

contract MessageStore {
    data: MsgTest = MsgTest{foo: 1};
}