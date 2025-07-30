struct Text {
    s: String;
}
contract StringContainer {
    val: Text;

    init() {
        self.val = Text{s:"hello world"};
    }
}