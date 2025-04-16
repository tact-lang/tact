struct Wrapped {
    text: String;
}

contract OptWrap {
    val: Wrapped?;

    init() {
        self.val = Wrapped{text: "hi"};
    }
}