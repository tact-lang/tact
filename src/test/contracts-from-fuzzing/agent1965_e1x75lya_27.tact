struct CC { a:Int; b:Int }

contract OnlyFields {
    param: CC;
    d: Int;

    init() {
        self.d = 42;
        self.param = CC{ a:1, b:2 };
    }
}