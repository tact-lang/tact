struct Holder {
    optStr: String?;
}
contract OptionalStringStructField {
    h: Holder;

    init() {
        self.h = Holder{ optStr: null };
    }
}