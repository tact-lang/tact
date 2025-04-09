struct Inner {
    a: Int;
    b: Bool;
}

struct Mid {
    x: Int;
    y: Inner;
}

struct Outer {
    m: Mid;
    s: String;
}

contract ManyLevels {
    o: Outer;

    init() {
        self.o = Outer{
            m: Mid{x:42, y: Inner{a:5, b:true}},
            s: "str"
        };
    }
}