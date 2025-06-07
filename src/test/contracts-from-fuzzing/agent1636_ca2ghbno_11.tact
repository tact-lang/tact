struct Payload {
    message: String;
    number: Int;
    optionalFlag: Bool?;
}

contract DeepOptional {
    stored: Payload?;

    init() {
        self.stored = Payload{
            message: "Hello",
            number: 42,
            optionalFlag: true
        };
    }
}
