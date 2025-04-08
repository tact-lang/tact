struct InnerMultiOpt {
    a: Int?;
    s: String?;
    b: Bool?;
}

contract TestContract {
    multi: InnerMultiOpt;

    init() {
        self.multi = InnerMultiOpt{
            a: null,
            s: null,
            b: true,
        };
    }
}