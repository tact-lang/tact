struct Outermost {
    level: Middle?;
}

struct Middle {
    inner: Deepest?;
}

struct Deepest {
    val: Int;
}

contract MultiOptNested {
    contents: Outermost;

    init() {
        self.contents = Outermost{
            level: Middle{
                inner: null
            }
        };
    }
}