struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    nested: Inner;
    ok: Bool;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{
                flag: true,
                count: 999,
            },
            ok: false,
        };
    }
}