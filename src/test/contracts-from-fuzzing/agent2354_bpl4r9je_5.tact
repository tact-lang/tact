struct OptionNest2 {
    x: Int?;
    y: Bool?;
}

struct OptionNest1 {
    inner: OptionNest2?;
}

contract OptionalNested {
    val: OptionNest1;

    init() {
        self.val = OptionNest1{ inner: null };
    }
}