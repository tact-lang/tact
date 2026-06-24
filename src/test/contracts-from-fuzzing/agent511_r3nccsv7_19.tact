struct Constanted {
    foo: Int = 7;
    bar: Bool;
}

contract DefaultsStruct {
    val: Constanted;

    init() {
        self.val = Constanted{ bar: false };
    }
}