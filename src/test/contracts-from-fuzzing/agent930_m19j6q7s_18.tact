struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool?;
}

struct Both {
    left: Inner1;
    right: Inner2;
}

contract MixedNesting {
    data: Both;

    init() {
        self.data = Both{
            left: Inner1{x: 11},
            right: Inner2{y: null}
        };
    }
}