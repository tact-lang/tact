struct DeeplyNested {
    inner: Inner;
}

struct Inner {
    mid: Mid;
}

struct Mid {
    low: Low;
}

struct Low {
    bottom: Bottom;
}

struct Bottom {
    val: Int;
}

contract TestContract {
    deeply: DeeplyNested;

    init() {
        self.deeply = DeeplyNested{
            inner: Inner{
                mid: Mid{
                    low: Low{
                        bottom: Bottom{
                            val: 31337
                        }
                    }
                }
            }
        };
    }
}