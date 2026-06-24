struct InnerEmbed {
    msg: String?;
    flag: Bool;
}

struct OuterEmbed {
    embed: InnerEmbed;
    number: Int;
}

contract NestedOptionals {
    data: OuterEmbed;

    init() {
        self.data = OuterEmbed{
            embed: InnerEmbed { msg: null, flag: true },
            number: 99
        };
    }
}