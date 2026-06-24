struct Inner {
    f: String?;
}

struct Outer {
    a: Inner;
    b: Inner?;
}

contract ComboTest {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{f: null},
            b: null
        };
    }
}