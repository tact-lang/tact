struct OptionalInside {
    a: Int;
    b: Bool?;
}

contract TestContract {
    data: OptionalInside?;

    init() {
        self.data = null;
    }
}