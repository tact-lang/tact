struct Inner {
    optVal: Int? = null;
}

struct Outer {
    inn: Inner;
}

contract NullDefaultInner {
    store: Outer;

    init() {
        self.store = Outer{
            inn: Inner{ optVal: 777 }
        };
    }

    receive() {
        let _ = self.store;
    }
}