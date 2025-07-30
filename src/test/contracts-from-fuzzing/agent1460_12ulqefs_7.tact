struct OptionalSerialize {
    a: Int? as uint8;
    b: Bool?;
}

contract TestContract {
    data: OptionalSerialize;

    init() {
        self.data = OptionalSerialize{ a: null, b: true };
    }
}