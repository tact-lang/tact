struct OptionalDeep {
    inner: OptionalInner?;
}

struct OptionalInner {
    deeper: OptionalDeeper?;
}

struct OptionalDeeper {
    flag: Bool;
}

contract DeepOptionals {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: OptionalInner{
                deeper: OptionalDeeper{
                    flag: true
                }
            }
        };
    }
}