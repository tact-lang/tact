struct Base {
    val: Int;
}

struct Wrap1 {
    inner: Base;
}

struct Wrap2 {
    w1: Wrap1;
}

struct Wrap3 {
    w2: Wrap2;
}

contract Wrapped {
    val: Wrap3;

    init() {
        self.val = Wrap3{
            w2: Wrap2{
                w1: Wrap1{
                    inner: Base{
                        val: 123,
                    },
                },
            },
        };
    }
}