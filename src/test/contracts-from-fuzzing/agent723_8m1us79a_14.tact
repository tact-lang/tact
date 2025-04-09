struct Inner {
    foo: Int?;
}

struct Wrapper {
    nested: Inner?;
}

contract TestContract {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            nested: null,
        };
    }

    receive() {}
}