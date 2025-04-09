struct PrimitiveNest {
    num: Int;
    flag: Bool;
    phrase: String;
}

contract PrimNestedHolder {
    nested1: PrimitiveNest;
    nested2: PrimitiveNest;
    flag: Bool;
    optStr: String?;

    init() {
        self.nested1 = PrimitiveNest{ num: 100, flag: true, phrase: "Hello" };
        self.nested2 = PrimitiveNest{ num: -100, flag: false, phrase: "World" };
        self.flag = true;
        self.optStr = null;
    }
}