struct InnerMost {
    val: Int?;
}

struct Middle {
    innerMost: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    storageVar: Outer;

    init() {
        self.storageVar = Outer{ middle: null };
    }
}