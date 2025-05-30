struct OptDeep {
    opt: Int?;
    inner: String?;
    deeper: Cell?;
    flag: Bool?;
}

contract TestContract {
    data: OptDeep;
    init() {
        self.data = OptDeep{
            opt: null,
            inner: null,
            deeper: null,
            flag: null,
        };
    }
}