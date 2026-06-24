struct Nested {
    text: String;
    count: Int;
}

struct WithNested {
    info: Nested;
    opt: Nested?;
}

contract MixedNestedOptionals {
    data: WithNested;

    init() {
        self.data = WithNested{
            info: Nested{ text:"abc", count:0 },
            opt: null
        };
    }

    receive() {
        let _= self.data;
    }
}