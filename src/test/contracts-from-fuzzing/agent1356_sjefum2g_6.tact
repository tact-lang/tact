struct OptionalDeep {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalDeepContract {
    state: OptionalDeep;

    init() {
        self.state = OptionalDeep{
            a:null,
            b:null,
            c:true
        };
    }
}