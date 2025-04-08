struct N {
    id: Int as uint32;
    flag: Bool;
}

struct M {
    i: Int as int64;
    s: String;
    n: N?;
}

contract SerializeNestedOpt {
    data: M;

    init() {
        self.data = M{
            i: 123456789,
            s: "hi",
            n: null
        };
    }

    receive() {}
}
