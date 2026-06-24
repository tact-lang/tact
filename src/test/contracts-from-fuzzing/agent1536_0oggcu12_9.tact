struct WithOptionalStr {
    s: String?;
}

contract OptionalStructHolder {
    inner: WithOptionalStr;

    init() {
        self.inner = WithOptionalStr{ s: null };
    }
}