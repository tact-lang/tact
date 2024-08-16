import "@stdlib/deploy";

primitive NInt;

@name(store_uint)
native native_store_uint(s: Builder, value: Int, bits: Int): Builder;

struct struct_decl_0 {
    a: Int;
    b: Int;
}

const constant_def_2: Int = 0;
const constant_def_3: String = "string";
const constant_def_4: Bool = true;
const constant_def_5: Bool = false;

fun function_def_1(x: Int, y: Int, z: Bool, m: Source): Bool {
    m.b = 10;
    return x + m.b > 0 && z;
}

contract contract_6 {
    a: Int;
    b: Int;
    c: Source;
    d: map<Int, Int>;

    const constant_def_7: Int = 42;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = Source{a: 0, b: 0};
    }

    fun function_def_8() {
        let d: Int? = null;
        self.a = 10;
        d = a > 0 ? self.a : 0;
        let res: Bool = isZero(1, 2, false, self.c);
        let e = 42;
        self.b = a;
        self.c = Source{a: 10, b: 20};
    }

    get fun function_def_9(): Int {
        self.addStake();
        return self.a;
    }

    receive("increment") {
        self.a -= 1;
    }
}
