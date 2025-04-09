struct OptionalMulti {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract OptMany {
    one: OptionalMulti?;
    two: OptionalMulti?;

    init() {
        self.one = null;
        self.two = null;
    }
}