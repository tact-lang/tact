struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

struct Wrapper {
    inner: NestedOptionals;
    flag: Bool;
}

contract OptionalWrap {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: NestedOptionals{
                a: null,
                b: null,
                c: null,
                d: null,
                e: null,
                f: null,
            },
            flag: true,
        };
    }

    receive() {
        let _ = self.data;
    }
}