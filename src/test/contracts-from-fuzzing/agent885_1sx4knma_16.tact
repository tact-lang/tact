struct MultiType {
    i: Int;
    s: String;
    b: Bool;
    oi: Int?;
    os: String?;
    ob: Bool?;
}

contract TestContract {
    mix: MultiType;

    init() {
        self.mix = MultiType{
            i: 1,
            s: "s",
            b: true,
            oi: null,
            os: "x",
            ob: false,
        };
    }
}