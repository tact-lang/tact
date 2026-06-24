struct S {
    id: Int;
    optA: Int?;
    optB: Bool?;
    optC: String?;
    text: String;
}

contract MixOptionalsData {
    s: S;

    init() {
        self.s = S{
            id: 1,
            optA: null,
            optB: true,
            optC: null,
            text: "t",
        };
    }
}