struct S {
    n: Int;
}

contract TestContract {
    a: S = S{n:1};
    b: S = S{n:2};
    c: S = S{n:3};
    d: S = S{n:4};
    e: S = S{n:5};

    init() {
        self.a = S{n:11};
        self.b = S{n:12};
        self.c = S{n:13};
        self.d = S{n:14};
        self.e = S{n:15};
    }
    receive(){}
}