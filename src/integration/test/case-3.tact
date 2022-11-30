struct Source {
    var a: Int;
    var b: Int;
}

fun isZero(x: Int, y: Int, z: Bool, m: Source): Bool {
    m.b = 10;
    let s: Source = Source{a: 10, b: 20};
    return (x + m.b) > 0 && z;
}

contract SampleContract {
    var a: Int;
    var b: Int;
    var c: Source;

    fun addStake() {
        self.a = 10;
        self.b = 20;
        self.c = Source{a: 10, b: 20};
    }
}