import "@stdlib/deploy";

primitive NInt;

struct Source {
    a: Int;
    b: Int;
}

@name(store_uint)
native storeUint(s: Builder, value: Int, bits: Int): Builder;

fun isZero(x: Int, y: Int, z: Bool, m: Source): Bool {
    m.b = 10;
    return x + m.b > 0 && z;
}

const a: Int = 0;
const s: String = "string";
const t: Bool = true;
const f: Bool = false;

contract SampleContract {
    a: Int;
    b: Int;
    c: Source;
    d: map<Int, Int>;

    const e: Int = 42;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = Source{a: 0, b: 0};
    }

    fun addStake() {
        let d: Int? = null;
        self.a = 10;
        d = a > 0 ? self.a : 0;
        let res: Bool = isZero(1, 2, false, self.c);
        let e = 42;
        self.b = a;
        self.c = Source{a: 10, b: 20};
    }

    get fun stake(): Int {
        self.addStake();
        return self.a;
    }

    receive("increment") {
        self.a -= 1;
    }
}
