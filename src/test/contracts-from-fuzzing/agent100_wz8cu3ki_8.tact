struct HasBool {
    flag: Bool;
}

struct HasString {
    text: String;
    deep: HasBool;
}

contract Test9 {
    complex: HasString;

    init() {
        self.complex = HasString{ text: "tact", deep: HasBool{ flag: true } };
    }
}