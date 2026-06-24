struct Mixed {
    i: Int;
    s: String;
    b: Bool;
    o: Int?;
    t: String?;
}

contract MixedFields {
    mix: Mixed;

    init() {
        self.mix = Mixed{
            i: 5,
            s: "hi",
            b: true,
            o: null,
            t: "opt"
        };
    }
}