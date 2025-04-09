struct Mid {
    a: Int;
    b: String?;
}

struct Outer {
    m1: Mid;
    m2: Mid;
    s: String;
    b: Bool;
}

contract ManyNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Mid{a: 1, b: null},
            m2: Mid{a: 2, b: "hi"},
            s: "hello",
            b: true
        };
    }
}