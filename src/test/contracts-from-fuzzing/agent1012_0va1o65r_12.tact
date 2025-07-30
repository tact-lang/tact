struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Middle {
    one: Inner1;
    two: Inner2;
}

contract MultipleEmbedded {
    m: Middle;

    init() {
        self.m = Middle{
            one: Inner1{ a:10 },
            two: Inner2{ b:20 }
        };
    }
}