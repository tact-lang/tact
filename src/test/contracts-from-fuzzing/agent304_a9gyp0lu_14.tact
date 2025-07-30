struct InitStruct {
    i: Int;
    b: Bool;
}

contract InitTest {
    v: InitStruct;
    init() {
        self.v = InitStruct{ i: 42, b: true };
    }
}
