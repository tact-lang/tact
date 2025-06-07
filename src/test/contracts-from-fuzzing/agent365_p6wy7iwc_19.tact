struct First {
    x: Int?;
}

struct Second {
    y: First?;
}

struct Third {
    z: Second?;
}

contract NestedNullableChain {
    data: Third;
    init() {
        self.data = Third{z: null};
    }
}