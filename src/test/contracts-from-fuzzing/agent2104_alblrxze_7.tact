struct Mix {
    i: Int;
    b: Bool;
    s: String;
    opt1: Int?;
    opt2: String?;
}

contract MixedNested {
    m: Mix;

    init() {
        self.m = Mix{
            i: 42,
            b: true,
            s: "hello",
            opt1: null,
            opt2: "opt"
        };
    }
}