struct Inner1 { x: Int; y: Bool; }
struct Inner2 { s: String; a: Address; }
struct Inner3 { c: Cell; sl: Slice; }

struct Combo {
    one: Inner1;
    two: Inner2;
    three: Inner3;
}

contract CrossTypeNesting {
    data: Combo;

    init() {
        self.data = Combo{
            one: Inner1{x: 7, y: true},
            two: Inner2{s: "hello", a: myAddress()},
            three: Inner3{c: emptyCell(), sl: emptyCell().asSlice()}
        };
    }
}
