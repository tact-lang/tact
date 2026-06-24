struct Boxed {
    s: String;
}

contract OptionalBox {
    box: Boxed?;

    init() {
        self.box = null;
    }
}