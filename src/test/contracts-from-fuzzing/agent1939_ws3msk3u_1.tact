struct Deep {
    nested: InnerOptional;
}

struct InnerOptional {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    val: Deep;

    init() {
        self.val = Deep{ nested: InnerOptional{ x: 42, y: null } };
    }
}