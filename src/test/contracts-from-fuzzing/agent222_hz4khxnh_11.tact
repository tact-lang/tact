struct DeepOptionalString {
    s: String?;
}

contract OptStringField {
    deep: DeepOptionalString = DeepOptionalString{s: null};

    receive() {
        self.deep = DeepOptionalString{s: "hey"};
    }
}