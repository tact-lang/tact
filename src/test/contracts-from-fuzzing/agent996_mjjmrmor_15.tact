struct DefaultedFields {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
    d: Int?; // defaults to null implicitly
}

contract TestStorage {
    df: DefaultedFields;

    init() {
        self.df = DefaultedFields{};
    }
}