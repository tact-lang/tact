struct InnerMost {
    a: Int;
}
struct Inner2 {
    i: InnerMost;
}
struct Inner1 {
    i: Inner2;
}
struct Mid {
    left: Inner1;
    right: Inner1;
}

contract SymmetricNested {
    state: Mid;

    init() {
        self.state = Mid{
            left: Inner1{ i: Inner2{ i: InnerMost{ a:5 } } },
            right: Inner1{ i: Inner2{ i: InnerMost{ a:10 } } }
        };
    }
}