struct Diverse {
    i: Int;
    b: Bool;
    s: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
}

contract DiverseFields {
    val: Diverse;

    init() {
        self.val = Diverse{
            i: 123,
            b: false,
            s: "text",
            optI: null,
            optB: null,
            optS: null,
        };
    }
}