struct NestedInner {
    val1: Int;
    val2: Bool;
}

struct Outer {
    point: NestedInner;
    enabled: Bool;
    description: String;
}

contract DeepStorage {
    data: Outer;

    init() {
        self.data = Outer{
            point: NestedInner{ val1: 5, val2: true },
            enabled: true,
            description: "hello fuzzing"
        };
    }
}