struct InnerOpt {
    text: String?;
}

struct OwnerOpt {
    inner: InnerOpt?;
}

contract OptInOpt {
    holder: OwnerOpt;

    init() {
        self.holder = OwnerOpt{
            inner: null
        };
    }
}