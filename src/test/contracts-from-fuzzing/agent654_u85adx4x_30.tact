message M {}

struct Container {
    m: M;
}

struct Wrapper {
    c: Container?;
}

contract C {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            c: null,
        };
    }
}