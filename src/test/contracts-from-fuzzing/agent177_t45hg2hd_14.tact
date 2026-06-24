struct EmbedOpt {
    id: Int = 0;
    note: String?;
}

contract EmbedOptionalFields {
    embed: EmbedOpt? = null;

    init() {
        self.embed = EmbedOpt{ id: 42, note: "hi" };
    }
    receive(){}
}