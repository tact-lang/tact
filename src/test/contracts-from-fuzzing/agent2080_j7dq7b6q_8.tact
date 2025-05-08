struct Payload {
    content: String;
}

contract TestContract {
    data: Payload?;
    init() {
        self.data = Payload{
            content: "fuzzing payload",
        };
    }
}