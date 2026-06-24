struct OptionalDeep {
    x: Int?;
    y: Bool?;
    s: String?;
    inr: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    txt: String?;
}

contract OptDeep {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            x: null,
            y: null,
            s: null,
            inr: InnerOpt{
                flag: true,
                txt: null
            }
        };
    }
}