struct Inner1 {
    val: Int;
}

struct Inner2 {
    text: String;
    optInner1: Inner1?;
}

struct Outer {
    first: Inner1;
    second: Inner2;
}

contract CrossNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            first: Inner1{ val: 7 },
            second: Inner2{ text: "hello", optInner1: null }
        };
    }
}