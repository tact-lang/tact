struct Layered {
    foo: Bool;
    bar: Inner;
}

struct Inner {
    baz: Int;
    bazOpt: Int?;
    deep: Deeper;
}

struct Deeper {
    s1: String;
    flag: Bool;
    s2: String;
}

contract MultiNestTest {
    state: Layered;
    init() {
        self.state = Layered{
            foo: true,
            bar: Inner{
                baz: 5,
                bazOpt: null,
                deep: Deeper{
                    s1: "A",
                    flag: false,
                    s2: "B"
                }
            }
        };
    }
}