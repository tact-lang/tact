// Test mixture of deeply nested optional types with 'remaining' overlay
struct Leaf {
    text: String;
}

struct WithOptional {
    leaf: Leaf?;
}

struct Top {
    content: WithOptional;
    rest: Cell as remaining;
}

contract DeepRemainOpt {
    data: Top;

    init() {
        self.data = Top {
            content: WithOptional { leaf: null },
            rest: emptyCell()
        };
    }
}