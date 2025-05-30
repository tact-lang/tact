struct MyStruct {
    first: Int;
    second: Bool;
}

contract OptStructStorage {
    opt: MyStruct?;
    init() {
        self.opt = null;
    }
}
