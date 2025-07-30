struct Optionals {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract OptionalPrimitives {
    val: Optionals;

    init() {
        self.val = Optionals{
            i: null,
            s: null,
            b: null,
        };
    }

    receive() {
        let v = self.val;
    }
}