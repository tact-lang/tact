struct InnerS {
    s: String;
}

struct MidS {
    inner: InnerS;
}

contract DeepStr {
    mid: MidS;

    init() {
        self.mid = MidS{
            inner: InnerS{
                s: "deepstring"
            }
        };
    }
}
