struct OptBoolInt {
    b: Bool?;
    i: Int?;
}

struct Wrap {
    ob: OptBoolInt;
    s: String;
}

contract TestContract {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            ob: OptBoolInt{ b: null, i: 3 },
            s: "hi"
        };
    }
}