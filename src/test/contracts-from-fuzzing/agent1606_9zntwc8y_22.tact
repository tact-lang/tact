struct StringLengths {
    s1: String;
    s2: String?
}

contract StringLengthFields {
    val: StringLengths;

    init() {
        self.val = StringLengths{
            s1: "",
            s2: null,
        };
    }

    receive() {
        let v = self.val;
    }
}