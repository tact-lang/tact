struct Reordered {
    i: Int;
    s: String;
    b: Bool;
    oi: Int?;
    os: String?;
    ob: Bool?;
}

contract TestContract {
    r: Reordered;

    init() {
        self.r = Reordered{
            i: 1,
            s: "str",
            b: true,
            oi: null,
            os: null,
            ob: false,
        };
    }
}