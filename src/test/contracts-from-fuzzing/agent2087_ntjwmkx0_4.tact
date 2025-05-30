struct Inner {
    f1: Int;
    f2: Bool?;
}

struct Outer {
    i: Int;
    inr: Inner;
    s: String?;
}

contract ManyOptions {
    data: Outer;

    init() {
        self.data = Outer{
            i: 10,
            inr: Inner{f1: 5, f2: null},
            s: null
        };
    }
}