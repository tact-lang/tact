struct NullableNested {
    innerOpt: Int?;
    nestedOpt: DeepNested?;
}

struct DeepNested {
    x: Int;
    y: String;
}

contract DoubleOptional {
    data: NullableNested = NullableNested{innerOpt: null, nestedOpt: null};

    init() {
        self.data = NullableNested{innerOpt: 10, nestedOpt: DeepNested{x:5, y:"hi"}};
    }

    receive() {
        let _ = self.data;
    }
}