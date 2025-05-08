contract OptionalUintOutOfBounds {
    counter: Int? as uint4;
    init() {
        self.counter = -1; // invalid for uint4; runtime error expected
    }
}
