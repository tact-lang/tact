struct Embed {
    description: String?;
    score: Int?;
}

struct Holder {
    embed: Embed?;
}

contract OptionalStructFill {
    holder: Holder;

    init() {
        self.holder = Holder{
            embed: Embed{}  // should default all fields to null
        };
    }
}