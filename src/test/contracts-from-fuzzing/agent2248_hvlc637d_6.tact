struct Combo {
    title: String;
    optInt: Int?;
    flag: Bool;
}

contract OptNested {
    combined: Combo?;

    init() {
        self.combined = Combo{
            title: "hello",
            optInt: null,
            flag: true
        };
    }
}