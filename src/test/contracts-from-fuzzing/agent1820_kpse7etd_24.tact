struct Text {
    s: String;
    opt: String?;
}

contract TestContract {
    textData: Text;
    init() {
        self.textData = Text{
            s: "abc",
            opt: null,
        };
    }
}