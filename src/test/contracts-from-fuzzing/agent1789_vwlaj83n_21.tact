struct EmbedBool {
    val: Bool;
}
struct EmbedString {
    str: String;
}

contract EmbeddedStructs {
    fst: EmbedBool;
    snd: EmbedString;

    init() {
        self.fst = EmbedBool{ val: true };
        self.snd = EmbedString{ str: "str" };
    }
}