struct OptionalDeep {
    o: Int?;
    s: String?;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{ o: null, s: null };
    }
}