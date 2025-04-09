struct Innermost {
    foo: Int;
}

struct Mid {
    inner: Innermost;
}

struct Top {
    mid: Mid;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                inner: Innermost{ foo: 42 }
            }
        };
    }

    receive() {
        self.data;
    }
}