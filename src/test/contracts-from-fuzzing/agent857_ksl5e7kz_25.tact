struct BigNested {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: Inner2;
}

struct Inner2 {
    e: Bool;
    f: String;
}

contract TestContract {
    test: BigNested = BigNested{
        a:1,
        b: Inner{
            c:2,
            d: Inner2{ e:false, f:"" }
        }
    };
}