struct Compose {
    x: Int;
    y: String;
}

contract ComposeTest {
    data: Compose;

    init() {
        self.data = Compose{
            x: 5,
            y: "hello"
        };
    }
}