struct OptDeep {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct HasOpt {
    inner: OptDeep;
    d: String?;
}

contract TestContract {
    data: HasOpt;

    init() {
        self.data = HasOpt{inner: OptDeep{a:null, b:null, c:null}, d: null};
    }
}
