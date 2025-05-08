struct Param {
    foo: Int;
}

struct Container {
    inner: Param?;
}

contract TestContract {
    c: Container?;

    init() {
        self.c = null;
    }
}