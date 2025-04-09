struct Mid {
    inner: Inner;
}

struct Inner {
    val: Int;
}

struct Wrapper {
    a: Int;
    m: Mid; 
    b: Int;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            a: 1,
            m: Mid{ inner: Inner{ val: 5 } },
            b: 2,
        };
    }
}
