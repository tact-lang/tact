struct Base {
    val: Int;
}

struct Embeds {
    b1: Base;
    b2: Base;
    b3: Base;
}

contract EmbedStructTest {
    data: Embeds;

    init() {
        self.data = Embeds{
            b1: Base{ val:1 },
            b2: Base{ val:2 },
            b3: Base{ val:3 }
        };
    }
}