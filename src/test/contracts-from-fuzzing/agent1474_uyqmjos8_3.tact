struct DeepNested {
    point: Nested;
    flag: Bool;
}

struct Nested {
    val: Int;
    label: String;
}

contract Test3 {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            point: Nested{ val: 5, label: "deep" },
            flag: true
        };
    }
}