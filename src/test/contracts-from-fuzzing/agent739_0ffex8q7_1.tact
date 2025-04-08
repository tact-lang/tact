struct InnerNested {
    alpha: Int;
    beta: Bool?;
}

struct OuterNested {
    x: Int;
    y: InnerNested;
    z: Bool?;
}

contract NestedStructTest {
    nestedField: OuterNested;

    init() {
        self.nestedField = OuterNested{
            x: 1,
            y: InnerNested{
                alpha: 2,
                beta: true,
            },
            z: null,
        };
    }

    receive() {
        // Access nested fields deeply
        let a = self.nestedField.y.alpha;
        let b = self.nestedField.z;
        let c = self.nestedField.y.beta;
    }
}