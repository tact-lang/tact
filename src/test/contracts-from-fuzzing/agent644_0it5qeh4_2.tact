struct Deep { a: Int; inner: Inner; }

struct Inner { b: Bool; inner2: Inner2; }

struct Inner2 { c: String; optD: Int?; }

contract Test {
    deepData: Deep;

    init() {
        self.deepData = Deep{
            a: 1,
            inner: Inner{
                b: true,
                inner2: Inner2{c: "x", optD: 10}
            }
        };
    }
}