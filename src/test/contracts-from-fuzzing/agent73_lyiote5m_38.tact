struct Wrapped {
    inner: Int;
}

struct Wrapper {
    wrap: Wrapped = Wrapped{ inner: 5 };
}

contract Test {
    data: Wrapper;

    init() {
        self.data = Wrapper{};
    }
}