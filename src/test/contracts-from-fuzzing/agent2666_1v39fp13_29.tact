struct Embed {
    num: Int;
    flag: Bool;
}

contract EmbedNested {
    val: Embed;

    init() {
        self.val = Embed{num: 3, flag: true};
    }
}