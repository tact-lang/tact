struct WrappedStrOpt {
    s: String?;
}

contract WithOptStr {
    data: WrappedStrOpt;

    init() {
        self.data = WrappedStrOpt{
            s: "hi"
        };
    }
}