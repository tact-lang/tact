struct Source {
    a: Int;
    b: Int;
}

message Shoko {
    amount: Int as uint32;
}

message Koko {
    amount: Int as uint32;
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

    receive(msg: Shoko) {

    }
    
    receive(msg: Koko) {

    }

    receive("Increment") {

    }

    
    bounced(msg: Shoko) {

    }
    
    bounced(msg: Koko) {

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