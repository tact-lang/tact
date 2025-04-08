struct OptionalFields {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract TestContract {
    state: OptionalFields;

    init() {
        self.state = OptionalFields{ x: null, y: null, z: null };
    }
}