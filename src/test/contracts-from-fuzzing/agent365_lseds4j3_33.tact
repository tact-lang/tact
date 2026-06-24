struct Sub {
    a: Int;
}

contract OptionStruct {
    s: Sub?;

    init() {
        self.s = null;
    }
}