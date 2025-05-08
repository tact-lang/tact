struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    inr: Inner;
    c: Int?;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            inr: Inner{
                a: 1,
                b: null
            },
            c: null
        };
    }

    receive() {
        self.storage = self.storage;
    }
}