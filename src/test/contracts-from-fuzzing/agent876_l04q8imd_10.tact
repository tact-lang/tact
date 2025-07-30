struct Combo {
    i1: Int;
    optBool: Bool?;
    s: String;
}

contract MixedFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            i1: 99,
            optBool: null,
            s: "test"
        };
    }

    receive() {
        dump(self.combo.i1);
    }
}