struct Deep {
    a: Int = 5;
    b: Int?;
}

struct Middle {
    inner: Deep;
}

struct Outer {
    top: Int;
    mid: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            top: 100,
            mid: Middle{ inner: Deep{ a: 42, b: null } }
        };
    }
}