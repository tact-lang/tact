struct Tiny {
    foo: Int?;
}

contract InitNullExplicit {
    val: Tiny;
    init() {
        self.val = Tiny{ foo: null };
    }
}