struct InnerS { p: Int; }

contract StructFieldDefault {
    s: InnerS;

    init() {
        self.s = InnerS{ p: 7 };
    }
}