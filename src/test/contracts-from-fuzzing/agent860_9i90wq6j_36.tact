struct HasString {
    s: String;
}

contract DefaultStringField {
    val: HasString = HasString{s:""};

    init() {
        self.val = HasString{s: "nonempty"};
    }
}