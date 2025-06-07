struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Mid {
    a: Inner1;
    b: Inner2;
}
struct Outer {
    mid: Mid;
    flag: Bool;
}

contract DeeplyNestedStructs {
    x: Outer;

    init() {
        self.x = Outer{
            mid: Mid{
                a: Inner1{ a:1 },
                b: Inner2{ b:2 }
            },
            flag: false
        };
    }
}