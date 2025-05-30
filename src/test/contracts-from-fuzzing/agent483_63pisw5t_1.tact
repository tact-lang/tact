struct NestedInner {
    x: Int;
    y: Int?;
}

struct NestedOuter {
    point: NestedInner;
    flag: Bool;
    text: String?;
}

contract TestNested {
    val: NestedOuter;
    
    init() {
        self.val = NestedOuter{
            point: NestedInner{
                x: 1,
                y: null,
            },
            flag: true,
            text: null,
        };
    }
}
