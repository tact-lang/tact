struct StrOnly {
    s: String;
}

contract OptStrStruct {
    x: StrOnly?;

    init() {
        self.x = null;
    }
}
