// test nested optional struct field prohibited
struct Sub {
    x: Int;
}

struct Outer {
    s: Sub?;
}

contract C {
    data: Outer;

    init() {
        self.data = Outer{
            s: null
        };
    }
}