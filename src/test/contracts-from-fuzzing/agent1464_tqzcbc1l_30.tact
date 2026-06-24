struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Both {
    x: Inner1?;
    y: Inner2?;
}

contract TestContract {
    compound: Both;

    init() {
        self.compound = Both{
            x: null,
            y: null
        };
    }
}