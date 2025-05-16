struct Data {
    x: Int;
    y: Int?;
    name: String;
    flag: Bool?;
}

contract OptionalFieldsTest {
    content: Data;

    init() {
        self.content = Data{
            x: 1,
            y: null,
            name: "hello",
            flag: null
        };
    }

    receive() {
        self.content = Data{
            x: 2,
            y: 3,
            name: "world",
            flag: true
        };
    }
}