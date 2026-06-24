struct Payload {
    number: Int;
    text: String;
}

contract OptionalStructWithValue {
    data: Payload?;

    init() {
        self.data = Payload{number: 10, text: "hi"};
    }
}