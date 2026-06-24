struct Third {
    x: Int as uint8;
    y: Int as int16;
}

struct Second {
    a: Third;
    b: Int as int64;
}

struct First {
    p: Second;
    q: Int as uint256;
}

contract TestContract {
    foo: First;

    init() {
        self.foo = First{
            p: Second{
                a: Third{
                    x: 1,
                    y: -1
                },
                b: 100000
            },
            q: 123456789012345678901234567890
        };
    }
}