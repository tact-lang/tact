struct Wrapped {
    inner: Int;
}

struct NestedNullable {
    w: Wrapped?;
    maybeBool: Bool?;
}

contract TestContract {
    n: NestedNullable;

    init() {
        self.n = NestedNullable{
            w: Wrapped{ inner: 17 },
            maybeBool: null
        };
    }
}