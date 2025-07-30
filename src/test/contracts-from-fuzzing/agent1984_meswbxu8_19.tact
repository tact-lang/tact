struct Top {
    n1: Nested1;
    n2: Nested2;
}

struct Nested1 {
    inner1: Inner1;
}

struct Nested2 {
    inner2: Inner2;
}

struct Inner1 {
    val: Int;
}

struct Inner2 {
    val: Int;
}

contract SeparateNests {
    t: Top;

    init() {
        self.t = Top{
            n1: Nested1{ inner1: Inner1{ val: 11 } },
            n2: Nested2{ inner2: Inner2{ val: 22 } },
        };
    }
}