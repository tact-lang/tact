struct Complex {
    number: Int as uint32;
    flag: Bool;
    text: String;
}

contract SerializedContract {
    state: Complex;

    init() {
        self.state = Complex{
            number: 123,
            flag: true,
            text: "test"
        };
    }
}