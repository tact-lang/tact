struct MsgStruct {
    value: Int;
}

contract MessageStructStorageTest {
    foo: MsgStruct;

    init() {
        self.foo = MsgStruct{value: 77};
    }
}