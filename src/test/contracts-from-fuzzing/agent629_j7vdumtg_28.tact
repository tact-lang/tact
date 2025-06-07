struct StrOpt {
    s: String?;
}
contract OptionalStringNull {
    so: StrOpt;

    init() {
        self.so = StrOpt{ s: null };
    }
}