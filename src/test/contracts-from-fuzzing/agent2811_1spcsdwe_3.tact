struct Optionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract OptStorage {
    val: Optionals;

    init() {
        self.val = Optionals{
            a: 1,
            b: null,
            c: null,
            d: true
        };
    }
}