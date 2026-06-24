// Optional struct wrapping multiple optional fields
struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract ManyLayeredOptional {
    content: Opts?;

    init() {
        self.content = null;
    }
}