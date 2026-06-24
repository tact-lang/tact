struct Deep {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract DeepOptionTest {
    deepOpt: Deep?; // default null

    init() {
        self.deepOpt = Deep{
            foo: 5,
            bar: true,
            text: "hello"
        };
    }

    receive() {}
}