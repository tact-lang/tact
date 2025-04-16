message(0x99) Info {
    text: String;
}

struct Combo {
    a: Int?;
    b: Bool?;
    c: Info?;
}

contract ManyOptionalsMixed {
    thing: Combo;

    init() {
        self.thing = Combo{
            a: null,
            b: null,
            c: null
        };
    }
}