struct DeepNested {
    x: Int;
    y: Int;
    msg: String;
}

struct Wrapper {
    nested: DeepNested;
    optNested: DeepNested?;
}

contract TestContract {
    content: Wrapper;

    init() {
        self.content = Wrapper{
            nested: DeepNested{ x: 5, y: 6, msg: "hi" },
            optNested: null,
        };
    }
}