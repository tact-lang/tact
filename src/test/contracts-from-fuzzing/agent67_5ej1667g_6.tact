struct Inner {
    m: map<Int, Int>;
}

struct Wrapper {
    data: Inner?;
}

contract TestContract {
    wrapper: Wrapper;
    init() {
        self.wrapper = Wrapper{ data: null };
    }
}