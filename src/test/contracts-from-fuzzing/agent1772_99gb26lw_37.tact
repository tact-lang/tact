struct Inner {
    a: Int?;
}

struct Outer {
    b: Inner;
    c: Inner?;
}

contract Test37 {
    data: Outer;

    init() {
        self.data = Outer{
            b: Inner{a: null},
            c: null
        };
    }

    get fun val(): Int? {
        return self.data.b.a;
    }
}