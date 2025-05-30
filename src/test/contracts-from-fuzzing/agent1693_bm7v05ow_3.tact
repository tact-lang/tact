struct OptionalInner {
    val: Int?;
    flag: Bool?;
}

contract OptionalStructStorage {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{ val: null, flag: null };
    }
}