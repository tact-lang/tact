struct Compose {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    val1: Bool;
    val2: String;
}

struct Inner2 {
    v1: Int;
    v2: Bool;
}

contract ComposeTest {
    composed: Compose;

    init() {
        self.composed = Compose{
            a: 101,
            b: Inner1{ val1: true, val2: "hi" },
            c: Inner2{ v1: -5, v2: false }
        };
    }
}