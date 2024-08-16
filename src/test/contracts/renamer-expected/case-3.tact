struct struct_decl_0 {
    a: Int;
    b: Int;
}

fun function_def_1(x: Int, y: Int, z: Bool, m: Source): Bool {
    m.b = 10;
    return 2 * x + m.b > 0 && z;
}

contract contract_2 {
    a: Int;
    b: Int;
    c: Source;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = Source{a: 0, b: 0};
    }

    fun function_def_3() {
        self.a = 10;
        self.b = -20;
        self.c = Source{a: 10, b: 20};
    }

    get fun function_def_4(): Int {
        return self.a;
    }
}
