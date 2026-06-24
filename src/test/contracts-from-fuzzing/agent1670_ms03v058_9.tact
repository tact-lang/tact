struct Base {
    s: String;
}

struct Embed1 {
    a: Base;
    flag: Bool;
}

struct Embed2 {
    b: Base;
    count: Int;
}

struct BothEmbed {
    one: Embed1;
    two: Embed2;
}

contract TestManyNested {
    data: BothEmbed;
    init() {
        self.data = BothEmbed{
            one: Embed1{
                a: Base{s:"hi"},
                flag: true
            },
            two: Embed2{
                b: Base{s:"bye"},
                count: 5
            }
        };
    }
}
