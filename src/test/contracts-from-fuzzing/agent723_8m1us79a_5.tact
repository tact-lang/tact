struct Nested {
    n: Int;
}

struct Wrapper {
    nested: Nested?;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            nested: null,
        };
    }

    receive() {}
}