message Update {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
}

contract SerializationTester {

    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;

    init(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int, i: Int) {
        self.a = a;
        self.b = b;
        self.c = c;
        self.d = d;
        self.e = e;
        self.f = f;
        self.g = g;
        self.h = h;
        self.i = i;

        // abi.dump(self.a);
        // abi.dump(self.b);
        // abi.dump(self.c);
        // abi.dump(self.d);
        // abi.dump(self.e);
        // abi.dump(self.f);
        // abi.dump(self.g);
        // abi.dump(self.h);
        // abi.dump(self.i);
    }

    receive() {
        // Deploy
    }

    receive(msg: Update) {
        self.a = msg.a;
        self.b = msg.b;
        self.c = msg.c;
        self.d = msg.d;
        self.e = msg.e;
        self.f = msg.f;
        self.h = msg.h;
        self.i = msg.i;

        // abi.dump(self.a);
        // abi.dump(self.b);
        // abi.dump(self.c);
        // abi.dump(self.d);
        // abi.dump(self.e);
        // abi.dump(self.f);
        // abi.dump(self.g);
        // abi.dump(self.h);
        // abi.dump(self.i);
    }

    get fun getA(): Int {
        return self.a;
    }
    get fun getB(): Int {
        return self.b;
    }
    get fun getC(): Int {
        return self.c;
    }
    get fun getD(): Int {
        return self.d;
    }
    get fun getE(): Int {
        return self.e;
    }
    get fun getF(): Int {
        return self.f;
    }
    get fun getG(): Int {
        return self.g;
    }
    get fun getH(): Int {
        return self.h;
    }
    get fun getI(): Int {
        return self.i;
    }
}