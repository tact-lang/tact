struct SOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct WrapOpt {
    inner: SOpt;
    label: String;
}

contract OptNested {
    w: WrapOpt;

    init() {
        self.w = WrapOpt{
            inner: SOpt{i:null,b:null,s:null},
            label: "wrap"
        };
    }
}