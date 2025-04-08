struct Bottom {
    val: Int?;
}

struct Middle {
    bottom: Bottom?;
}

struct Top {
    middle: Middle?;
}

contract DeepOptionals {
    root: Top?;

    init() {
        self.root = null;
    }
}