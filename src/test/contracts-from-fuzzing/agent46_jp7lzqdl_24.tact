struct WrappedStr {
    s: String?;
}

contract PersistWrapped {
    val: WrappedStr;

    init() {
        self.val = WrappedStr{ s: null };
    }
}
