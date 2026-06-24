struct Embed {
    v: Int;
}

contract AssignEmbed {
    embedded: Embed;
    init() {
        self.embedded = Embed{v:100};
    }
}