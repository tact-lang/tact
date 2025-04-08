struct InnerOpt {
    v: Int?;
}

struct HasOpt {
    data: InnerOpt?;
    s: String;
}

contract OptStructOptField {
    f: HasOpt;

    init() {
        self.f = HasOpt{
            data: null,
            s: "done"
        };
    }
}