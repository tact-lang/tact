struct Source {
    a: Int;
    b: Int;
}

fun isZero(x: Int, y: Int, z: Bool, m: Source): Bool {
    m.b = 10;
    return (x + m.b) > 0 && z;
}

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
}