struct Inner {
    flag: Bool;
}

struct Wrapper {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
}

contract TestContract {
    list: Wrapper;

    init() {
        self.list = Wrapper{
            nested1: Inner{ flag: true },
            nested2: Inner{ flag: false },
            nested3: Inner{ flag: true }
        };
    }
}