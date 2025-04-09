struct BigStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    bigOpt: BigStruct?;

    init() {
        self.bigOpt = null;
    }
}