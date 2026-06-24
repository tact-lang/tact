struct InnerMost {
    val: Int?;
}

struct Mid {
    inner: InnerMost?;
}

struct OuterOptional {
    mid: Mid?;
}

contract ChainOptionals {
    field: OuterOptional?;

    init() {
        self.field = null;
    }
}