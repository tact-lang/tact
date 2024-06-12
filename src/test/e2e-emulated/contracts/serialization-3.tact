message Update {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Builder;
    f: String;
}

contract SerializationTester {

    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Builder;
    f: String;

    init(a: Int, b: Bool, c: Cell, d: Slice, e: Builder, f: String) {
        self.a = a;
        self.b = b;
        self.c = c;
        self.d = d;
        self.e = e;
        self.f = f;
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
    }

    get fun getA(): Int {
        return self.a;
    }
    get fun getB(): Bool {
        return self.b;
    }
    get fun getC(): Cell {
        return self.c;
    }
    get fun getD(): Slice {
        return self.d;
    }
    get fun getE(): Builder {
        return self.e;
    }
    get fun getF(): String {
        return self.f;
    }
}