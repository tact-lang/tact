struct Inner {
    id: Int;
    label: String?;
}

struct Outer {
    first: Inner?;
    second: Inner?;
}

contract Fuzz28 {
    val: Outer;

    init() {
        self.val = Outer{
            first: null,
            second: null,
        };
    }
}