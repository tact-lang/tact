struct Combo {
    id: Int;
    opt: Int?;
    text: String;
    yes: Bool;
}

contract MixedFields {
    record: Combo;

    init() {
        self.record = Combo{
            id: 1,
            opt: null,
            text: "hello",
            yes: true
        };
    }
}