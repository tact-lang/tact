struct HasOptionalStr {
    info: String?;
}

contract OptionalStringStore {
    inner: HasOptionalStr;
    init() {
        self.inner = HasOptionalStr{ info: null };
    }
}