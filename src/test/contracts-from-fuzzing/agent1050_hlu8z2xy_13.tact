struct TinyStruct {
    a: Int;
}

contract TestTiny {
    val: TinyStruct;

    init() {
        self.val = TinyStruct{a:123};
    }
}
