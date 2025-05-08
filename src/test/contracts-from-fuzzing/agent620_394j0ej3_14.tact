struct Inner {
    v1: Int;
    v2: Bool?;
    v3: Address;
}

struct Container {
    f1: Int as uint8;
    f2: Bool;
    f3: Inner?;
    f4: String?;
    f5: Address;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Container;
    e: Inner;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = Container{
            f1: 255,
            f2: false,
            f3: null,
            f4: null,
            f5: myAddress()
        };
        self.e = Inner{
            v1: 5,
            v2: null,
            v3: myAddress()
        };
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        if (self.d.f3 != null) {
            let _ = self.d.f3!!.v1;
        }
        if (self.d.f4 != null) {
            let _ = self.d.f4!!;
        }
        let _ = self.d.f1;
        let _ = self.d.f2;
        let _ = self.d.f5;
        let _ = self.e.v1;
        if (self.e.v2 != null) {
            let _ = self.e.v2!!;
        }
        let _ = self.e.v3;
    }
}