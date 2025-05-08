// contract with repeated nested struct instances containing optionals
struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inn1: Inner?;
    inn2: Inner?;
}

contract TestRepeat {
    val: Outer;

    init() {
        self.val = Outer{
            inn1: Inner{ x: 1, y: null },
            inn2: Inner{ x: null, y: true }
        };
    }
}