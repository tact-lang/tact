struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    name: String;
    amount: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{a: 11, b: true},
                flag: false
            },
            name: "nested",
            amount: 1000
        };
    }
}