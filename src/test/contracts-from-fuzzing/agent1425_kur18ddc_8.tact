struct Inside {
    flag: Bool?;
}

struct Wrapper {
    inner: Inside?;
}

contract TestContract {
    data: Wrapper?;

    init() {
        self.data = null;
    }

    receive() {}
}