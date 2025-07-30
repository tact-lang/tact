struct Sub {
    s: String;
}
struct Wrap {
    w: Sub?;
}

contract OptStringInside {
    val: Wrap;
    init() {
        self.val = Wrap { w: null };
    }
}