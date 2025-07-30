struct Embed {
    val: Int;
}

struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Embed;
    e: Embed?;
    f: Int?;
}

contract MixPersist {
    storage: Mix;

    init() {
        self.storage = Mix{
            a:5,
            b:null,
            c:"hi",
            d:Embed{ val:10 },
            e:null,
            f:42
        };
    }

    receive() {}
}