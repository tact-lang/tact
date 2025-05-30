struct SOpt {
    val: Int?;
}

contract OptionalUnset {
    data: SOpt;

    init() {
        self.data = SOpt{}; // omit optional, should default null
    }
}