struct Base {
    text: String?;
    flag: Bool?;
    val: Int?;
}

contract TopOptionals {
    f: Base?;

    init() {
        self.f = null;
    }
}