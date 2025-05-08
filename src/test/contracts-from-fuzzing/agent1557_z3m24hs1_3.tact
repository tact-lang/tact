struct HasOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructFields {
    state: HasOptionals;

    init() {
        self.state = HasOptionals{ x: null, y: true, z: null };
    }
}