struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: String?;
}

contract TestContract {
    data: Opts;

    init() {
        self.data = Opts{}; // all optionals default null
    }

    receive() {
        let a = self.data.a;
        let b = self.data.b;
        let c = self.data.c;
        let d = self.data.d;
        let e = self.data.e;
    }
}