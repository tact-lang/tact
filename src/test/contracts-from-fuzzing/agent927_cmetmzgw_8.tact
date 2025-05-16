struct Optionals {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptNil {
    val: Optionals;

    init() {
        self.val = Optionals{
            s: null,
            i: null,
            b: null
        };
    }
}