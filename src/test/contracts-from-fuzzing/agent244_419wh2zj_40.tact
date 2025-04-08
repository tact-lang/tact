// Contract field with nested struct containing mixed optional, default, primitive
struct NestedLeaf {
    x: Int?;
    y: Bool = false;
    label: String;
}

contract MixOptDefPrim {
    data: NestedLeaf;

    init() {
        self.data = NestedLeaf{
            x: null,
            y: true,
            label: "label"
        };
    }
}