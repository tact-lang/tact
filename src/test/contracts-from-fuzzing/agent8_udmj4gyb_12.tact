struct Inner1 {
    a: Int?;
    b: Bool?;
}

struct Inner2 {
    c: String?;
    d: Address?;
}

struct Outer {
    inner1: Inner1?;
    inner2: Inner2?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: null,
            inner2: null,
        };
    }
}
