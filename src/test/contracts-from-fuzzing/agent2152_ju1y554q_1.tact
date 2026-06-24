struct Nested {
    x: Int;
    y: Bool;
}

struct DeepNested {
    first: Nested;
    second: Nested;
}

contract TestContract {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            first: Nested{ x:1, y:true },
            second: Nested{ x:2, y:false }
        };
    }
}