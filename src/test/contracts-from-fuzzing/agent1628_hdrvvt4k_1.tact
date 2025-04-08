struct DeepNested {
    a: Int;
    b: Bool;
    c: SubNested;
}

struct SubNested {
    x: Int;
    y: Bool;
}

contract TestContract {
    field: DeepNested;
    
    init() {
        self.field = DeepNested{
            a: 7,
            b: true,
            c: SubNested{
                x: 3,
                y: false
            }
        };
    }
}
