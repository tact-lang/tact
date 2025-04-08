struct MultiNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    s: String;
    flag: Bool;
}

struct Inner2 {
    val: Int;
    s2: String;
}

contract ComplexNest {
    f: MultiNested;

    init() {
        self.f = MultiNested{
            a: 1,
            b: Inner1{
                s: "hi",
                flag: false
            },
            c: Inner2{
                val: 3,
                s2: "hello"
            }
        };
    }
}
