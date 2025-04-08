struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner;
}

contract ChainOptional {
    val: Middle?;

    init() {
        self.val = Middle{ inner: Inner{ x: 5 } };
    }
}