struct FlatDefault {
    a: Int = 7;
    b: Bool = true;
    c: Int?;
    d: Bool?;
}

contract DefInit {
    val: FlatDefault;

    init() {
        self.val = FlatDefault{ a: 1, b: false, c: null, d: true };
    }
}
