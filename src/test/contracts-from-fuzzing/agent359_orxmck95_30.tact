message ExampleMsg {
    foo: Int;
    bar: Bool?;
}

struct Wrap {
    m: ExampleMsg;
    note: String;
}

contract TestContract {
    item: Wrap;

    init() {
        self.item = Wrap{ m: ExampleMsg{ foo: 1, bar: null }, note: "hi" };
    }
}