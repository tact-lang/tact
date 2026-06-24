struct Inner {
    val: Int?;
}
struct Mid {
    data: Inner;
}

contract ChainOptional {
    root: Mid;

    init() {
        self.root = Mid{
            data: Inner{
                val: null
            }
        };
    }
}