struct Opts {
    a: Int?;
    b: Bool?;
}

contract ChangeOptionFields {
    o: Opts;

    init() {
        self.o = Opts{a: null, b: null};
        self.o.a = 10;
        self.o.b = true;
    }
}