struct Inner {
    val: Int?;
}

struct Mid {
    inn: Inner?;
}

contract OptionalConstructorSkip {
    m: Mid?;

    init() {
        self.m = Mid{ inn: Inner{} };
    }
}