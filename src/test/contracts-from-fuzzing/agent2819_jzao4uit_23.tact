// optional of a struct with optional fields inside
struct InnerOpt {
    value: Int?;
    flag: Bool?;
}

contract TestContract {
    inner: InnerOpt?;

    init() {
        self.inner = InnerOpt{
            value: null,
            flag: true
        };
    }
}