struct Embed {
    a: Int?;
    b: String?;
}

contract ManyNullables {
    e1: Embed?;
    e2: Embed?;

    init() {
        self.e1 = null;
        self.e2 = null;
    }
}