// Chain of nested structs with default optional inners
struct Bottom {
    val: Int?;
}

struct Middle {
    inner: Bottom?;
}

struct Top {
    mid: Middle?;
}

contract ChainOptional {
    storage: Top?;

    init() {
        self.storage = Top{mid: Middle{inner: Bottom{val: null}}};
    }
}