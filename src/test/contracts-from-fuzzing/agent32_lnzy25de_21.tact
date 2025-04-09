struct Combo {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            i: 5,
            b: true,
            s: "test",
            oi: null,
            ob: false,
        };
    }
}