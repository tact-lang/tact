// Explicitly setting only some persistent fields in init (others have default), expecting allowed
contract Test {
    a: Int = 3;
    b: String;
    c: Bool = true;

    init() {
        self.b = "hello";
    }
}