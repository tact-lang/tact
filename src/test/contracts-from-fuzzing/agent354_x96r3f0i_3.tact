struct OptionalStructInner { count: Int; flag: Bool; }

contract OptionalStructField {
    optInner: OptionalStructInner?;

    init() {
        self.optInner = null;
    }
}
