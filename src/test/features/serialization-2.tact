struct Vars {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct Both {
    a: Vars;
    b: Vars;
}

message Update {
    a: Vars;
    b: Vars;
}

contract SerializationTester2 {

    a: Vars;
    b: Vars;

    init(a: Vars, b: Vars) {
        self.a = a;
        self.b = b;
        
        // abi.dump(self.a.a);
        // abi.dump(self.a.b);
        // abi.dump(self.a.c);
        // abi.dump(self.a.d);
        // abi.dump(self.a.e);
        // abi.dump(self.b.a);
        // abi.dump(self.b.b);
        // abi.dump(self.b.c);
        // abi.dump(self.b.d);
        // abi.dump(self.b.e);
    }

    receive() {
        // Deploy
    }

    receive(msg: Update) {
        self.a = msg.a;
        self.b = msg.b;

        // abi.dump(self.a.a);
        // abi.dump(self.a.b);
        // abi.dump(self.a.c);
        // abi.dump(self.a.d);
        // abi.dump(self.a.e);
        // abi.dump(self.b.a);
        // abi.dump(self.b.b);
        // abi.dump(self.b.c);
        // abi.dump(self.b.d);
        // abi.dump(self.b.e);
    }

    get fun getA(): Vars {
        return self.a;
    }

    get fun getAopt(): Vars? {
        return self.a;
    }

    get fun getB(): Vars {
        return self.b;
    }

    get fun getBopt(): Vars? {
        return self.b;
    }

    get fun getBoth():Both {
        return Both{a: self.a, b: self.b};
    }

    get fun getBothOpt():Both? {
        return Both{a: self.a, b: self.b};
    }

    get fun process(src: Vars, both: Both, both2: Both?): Vars {
        return Vars{a: src.a + 1, b: src.b + 2, c: src.c + 3, d: src.d + 4, e: src.e + 5};
    }
}