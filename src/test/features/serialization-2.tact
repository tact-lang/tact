struct Vars {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
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
        
        abi.dump(self.a.a);
        abi.dump(self.a.b);
        abi.dump(self.a.c);
        abi.dump(self.a.d);
        abi.dump(self.a.e);
        abi.dump(self.b.a);
        abi.dump(self.b.b);
        abi.dump(self.b.c);
        abi.dump(self.b.d);
        abi.dump(self.b.e);
    }

    receive(msg: Update) {
        self.a = msg.a;
        self.b = msg.b;

        abi.dump(self.a.a);
        abi.dump(self.a.b);
        abi.dump(self.a.c);
        abi.dump(self.a.d);
        abi.dump(self.a.e);
        abi.dump(self.b.a);
        abi.dump(self.b.b);
        abi.dump(self.b.c);
        abi.dump(self.b.d);
        abi.dump(self.b.e);
    }

    get fun getA(): Vars {
        return self.a;
    }
    get fun getB(): Vars {
        return self.b;
    }
}