struct TwoLevelOptional {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool?;
}

contract OptionalInStruct {
    state: TwoLevelOptional;

    init() {
        self.state = TwoLevelOptional{
            inner: Inner{
                a: 123,
                b: null
            }
        };
    }
}