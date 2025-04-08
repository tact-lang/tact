struct BigNest {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
}

struct Sub {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract BigNestTest {
    b: BigNest;

    init() {
        self.b = BigNest{
            sub1: Sub{ foo:1, bar:true, baz:"a" },
            sub2: Sub{ foo:2, bar:false, baz:"b" },
            sub3: Sub{ foo:3, bar:true, baz:"c" }
        };
    }
}