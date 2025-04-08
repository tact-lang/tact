struct Combo {
    opt_int: Int?;
    simple_bool: Bool;
    text: String;
}

contract OptionalAndPlain {
    combo: Combo;

    init() {
        self.combo = Combo{
            opt_int: null,
            simple_bool: true,
            text: "combo"
        };
    }
}