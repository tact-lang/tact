struct Complex {
    a: Int;
    b: Bool?;
    c: String;
}

contract ManyOptionals {
    x: Complex?;
    init() {
        self.x = null;
    }
}