// Optional fields around required with nested
struct Mix2 {
    start: Int?;
    inner: Inner2?;
    finish: Int?;
}

struct Inner2 {
    a: Int;
    b: Bool?;
}

contract Mix2Test {
    d: Mix2;

    init() {
        self.d = Mix2{
            start: null,
            inner: Inner2{a: 5, b: true},
            finish: null
        };
    }
}
