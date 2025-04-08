struct S {
    x: Int?;
}

struct T {
    y: S?;
}

contract OptionalNested {
    val: T;

    init() {
        self.val = T{
            y: null
        };
    }
}