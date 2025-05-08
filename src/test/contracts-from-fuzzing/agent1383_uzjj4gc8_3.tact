struct DeepNested {
    x: Int;
    y: String?;
}

struct Middle {
    deep: DeepNested;
    z: Bool;
}

contract DeepNestContract {
    mid: Middle;

    init() {
        self.mid = Middle{
            deep: DeepNested{
                x: 100,
                y: null
            },
            z: true
        };
    }
}