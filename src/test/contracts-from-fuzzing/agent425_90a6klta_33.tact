// stress deeply nested optional of optional of optional field
// known nested optionals are disallowed, but optional containing Struct containing optional is allowed.

struct Leaf {
    val: Int?;
}

struct Mid {
    inner: Leaf?;
}

struct Top {
    middle: Mid;
}

contract TestContract {
    state: Top;

    init() {
        self.state = Top{
            middle: Mid{ inner: null }
        };
    }
}