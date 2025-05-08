struct Payload {
    s: String;
    n: Int;
    b: Bool;
}

contract PayloadOptionalField {
    data: Payload?;

    init() {
        self.data = null;
    }
}
