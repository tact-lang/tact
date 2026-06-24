struct Inner {
    m: Int;
    n: Int?;
}

struct Outer {
    inr: Inner?;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inr: Inner{ m: 7, n: null },
            flag: true
        };
    }
}