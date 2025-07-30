struct NeverInit {
    some: Int;
    more: Bool;
}

contract OptionalNone {
    maybe: NeverInit?;
    init() {
        // do NOT touch self.maybe at all
    }
}