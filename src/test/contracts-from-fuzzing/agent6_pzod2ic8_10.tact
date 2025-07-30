struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    s: S1;
    label: String;
}

contract NestedInVariable {
    data: S2;
    
    init() {
        self.data = S2{
            s: S1{ x: 5, y: true },
            label: "label",
        };
    }
}