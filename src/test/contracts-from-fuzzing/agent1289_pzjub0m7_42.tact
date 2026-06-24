struct Info {
    x: Int;
}

contract OptionalStructDefault {
    details: Info? = null;

    init() {
        self.details = Info{ x: 123 };
    }
}