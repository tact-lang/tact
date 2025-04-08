struct VeryNested {
    one: Int;
    two: InnerLayer;
}

struct InnerLayer {
    three: Deepest;
}

struct Deepest {
    four: Int;
    five: Bool?;
}

contract NestedStructs {
    data: VeryNested;

    init() {
        self.data = VeryNested{
            one: 11,
            two: InnerLayer{
                three: Deepest{ four: 5, five: null }
            }
        };
    }
}