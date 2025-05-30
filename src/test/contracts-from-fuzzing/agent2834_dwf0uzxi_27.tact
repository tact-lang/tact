struct RecTwo {
    left: Int;
    right: Int;
}

struct RecOne {
    a: RecTwo;
    b: RecTwo;
}

contract RepeatedNested {
    data: RecOne;

    init() {
        self.data = RecOne{
            a: RecTwo{ left:1, right:2 },
            b: RecTwo{ left:3, right:4 }
        };
    }
}