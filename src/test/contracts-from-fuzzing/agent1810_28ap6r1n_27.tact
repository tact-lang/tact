struct FullCombo {
    x: Int;
    y: Int?;
    z: Bool;
    w: Bool?;
    t: String;
    u: String?;
}

contract ComboStore {
    c: FullCombo;
    init() {
        self.c = FullCombo{
            x: 1,
            y: null,
            z: true,
            w: null,
            t: "text",
            u: null
        };
    }
}