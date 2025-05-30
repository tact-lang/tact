struct EmbeddedConstants {
    a: Int;
    b: Int = 5; // default value
    c: Bool;
    d: Bool = true; // default value
}

contract TestContract {
    data: EmbeddedConstants;

    init() {
        self.data = EmbeddedConstants{
            a: 42,
            c: false,
        };
    }
}