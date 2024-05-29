import "@stdlib/deploy";

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

contract SampleContract {
    a: Int;
    b: Int;
    c: Source;
    d: map<Int, Int>;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = Source{a: 0, b: 0};
    }

    fun addStake() {
        self.a = 10;
        self.b = -20;
        self.c = Source{a: 10, b: 20};
    }

    get fun stake(): Int {
        return self.a;
    }

    receive("increment") {
        self.a -= 1;
    }
}