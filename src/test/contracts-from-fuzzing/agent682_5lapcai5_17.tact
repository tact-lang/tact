struct NestedStringOpt {
    x: String?;
    y: InnerString;
}

struct InnerString {
    z: String?;
}

contract TestContract {
    n: NestedStringOpt;

    init() {
        self.n = NestedStringOpt{
            x: "hi",
            y: InnerString{
                z: null
            }
        };
    }
}