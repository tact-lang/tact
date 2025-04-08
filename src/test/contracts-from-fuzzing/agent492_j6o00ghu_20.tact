struct OptionalPayload {
    val: Int;
    text: String;
}

contract DeepOptional {
    opt1: OptionalPayload?;
    opt2: OptionalPayload?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
    }
}