struct MixedOptional {
    a: Int?;
    b: Bool;
    c: Int?;
    d: Bool;
}

contract TestContract {
    val: MixedOptional;

    init() {
        self.val = MixedOptional{ a: null, b: false, c: null, d: true };
    }
}