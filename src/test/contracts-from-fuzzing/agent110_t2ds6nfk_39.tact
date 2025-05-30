struct Nested {
    s: String?;
    n: Int?;
    flag: Bool = false;
}

struct Wrap {
    x: Nested;
    y: Bool;
}

contract DefaultsNested {
    val: Wrap;
    init() {
        self.val = Wrap{ x: Nested{}, y: true };
    }
}