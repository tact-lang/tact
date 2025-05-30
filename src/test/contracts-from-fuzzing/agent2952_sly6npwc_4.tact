struct OptionalHolder {
    maybeInt: Int?;
    maybeBool: Bool?;
}

contract OptionalStructTest {
    data: OptionalHolder;

    init() {
        self.data = OptionalHolder{ maybeInt: null, maybeBool: null };
    }
}