struct Description {
    title: String;
    details: String?;
    important: Bool;
}

contract Textual {
    info: Description;

    init() {
        self.info = Description{
            title: "Big Contract",
            details: "This optional string contains more extensive details for testing.",
            important: true,
        };
    }
}