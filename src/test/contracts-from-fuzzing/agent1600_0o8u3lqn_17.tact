struct Tiny {
    x: Int;
}

contract TinyFields {
    t1: Tiny;
    t2: Tiny;
    t3: Tiny;
    t4: Tiny;

    init() {
        self.t1 = Tiny{x:1};
        self.t2 = Tiny{x:2};
        self.t3 = Tiny{x:3};
        self.t4 = Tiny{x:4};
    }
}