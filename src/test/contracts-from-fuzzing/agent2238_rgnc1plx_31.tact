// Test nested structs with mixed optional/required fields
struct Inner {
    a: Int;
    b: Bool?;
}

struct Mid {
    inner: Inner;
    c: String?;
}

struct Outer {
    mid: Mid;
    d: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner: Inner{
                    a:123,
                    b:null
                },
                c: null
            },
            d: 456
        };
    }
}
