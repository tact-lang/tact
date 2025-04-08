struct S {
    u: Int as uint4;
    n: Int as int64;
    s: String;
    b: Bool;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            u: 7,
            n: -40,
            s: "serialize",
            b: true,
        };
    }

    receive() {}
}