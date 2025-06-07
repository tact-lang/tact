struct Rec {
    t: String;
    opt: Int?;
}

contract OptDefaults {
    val: Rec;

    init() {
        self.val = Rec{
            t: "defaults",
            opt: null,
        };
    }
}