struct Nested {
    num: Int;
    text: String;
    optVal: Int?;
}

contract TestContract {
    data: Nested = Nested{
        num: 5,
        text: "hello",
        optVal: null,
    };

    init() {
        self.data = Nested{
            num: 10,
            text: "world",
            optVal: 42,
        };
    }

    receive() {
        let a = self.data.num;
    }
}