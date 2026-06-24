struct BigNested {
    s1: Nested1;
    s2: Nested2;
}

struct Nested1 {
    val: Int;
    inner: Inner1;
}

struct Nested2 {
    flag: Bool?;
    str: String;
}

struct Inner1 {
    subflag: Bool;
    optStr: String?;
}

contract TestContract {
    bigNested: BigNested;

    init() {
        self.bigNested = BigNested{
            s1: Nested1{
                val: 1,
                inner: Inner1{ subflag: true, optStr: null }
            },
            s2: Nested2{
                flag: null,
                str: "hi"
            }
        };
    }
}