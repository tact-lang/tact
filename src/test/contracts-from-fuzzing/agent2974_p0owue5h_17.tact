// Contract field with a struct with defaulted fields and nested optional
struct Inner {
    x: Int = 1;
    y: Bool?;
}

struct Outer {
    a: Inner;
    b: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{ y: true },
            b: null,
        };
    }
}