struct Some {
    flag: Bool;
    text: String;
}

contract OptionalField {
    s: Some?;

    init() {
        self.s = Some{ flag: true, text: "text" };
    }
}