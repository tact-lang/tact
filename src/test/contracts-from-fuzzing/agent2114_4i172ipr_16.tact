struct Embed {
    str: String;
    num: Int;
    flag: Bool;
}

contract OptionalEmbedded {
    data: Embed?;

    init() {
        self.data = Embed{
            str: "embed",
            num: 100,
            flag: true
        };
    }
}
