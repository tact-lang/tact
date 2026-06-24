contract EmptyOptFieldsDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;

    receive() {
        let _ = self.a != null ? self.a!! : 0;
    }
}