struct OneField {
    val: Int;
}

struct Embed {
    sub: OneField;
}

struct TwiceEmbed {
    first: Embed;
    second: Embed;
}

contract MultiEmbed {
    data: TwiceEmbed;

    init() {
        self.data = TwiceEmbed{
            first: Embed{ sub: OneField{ val: 1 } },
            second: Embed{ sub: OneField{ val: 2 } }
        };
    }
}