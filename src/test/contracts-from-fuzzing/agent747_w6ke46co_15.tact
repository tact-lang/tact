contract TestContract {
    simple: SimpleStruct;

    init() {
        self.simple = SimpleStruct{
            number: 42,
            text: "hello"
        };
    }
}

struct SimpleStruct {
    number: Int;
    text: String;
}
