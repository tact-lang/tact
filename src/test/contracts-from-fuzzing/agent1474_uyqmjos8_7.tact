struct DeepOpt {
    inner: Opt;
    flag: Bool;
}

struct Opt {
    val: Int?;
    label: String?;
}

contract Test7 {
    dopt: DeepOpt;
    init() {
        self.dopt = DeepOpt{
            inner: Opt{ val: null, label: null },
            flag: false
        };
    }
}