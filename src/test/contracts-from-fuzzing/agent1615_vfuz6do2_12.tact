struct Bottom {
    foo: Int?;
    bar: String?;
}

struct Middle {
    inner: Bottom?;
}

struct Top {
    middle: Middle?;
}

contract TestContract {
    chain: Top;

    init() {
        self.chain = Top {
            middle: Middle {
                inner: null
            }
        };
    }

    receive() {}
}