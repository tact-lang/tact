struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    point: Nested;

    init() {
        self.point = Nested{ inner: InnerStruct{ x: 1, y: null } };
    }
}