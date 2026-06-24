struct Inner1 { a: Int; }
struct Inner2 { a: Int; }

struct Outer {
    x: Inner1;
    y: Inner2;
}

contract EmbedTwice {
    externalState: Outer;

    init() {
        self.externalState = Outer{
            x: Inner1{a:1},
            y: Inner2{a:2}
        };
    }
}