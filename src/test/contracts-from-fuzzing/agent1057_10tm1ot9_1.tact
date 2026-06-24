struct DeeplyNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
    optionalInner2: Inner2?;
}

struct Inner2 {
    intField: Int;
    boolField: Bool;
    optionalBool: Bool?;
}

contract TestContract {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{
            inner1: Inner1{
                inner2: Inner2{
                    intField: 1,
                    boolField: true,
                    optionalBool: false
                },
                optionalInner2: null
            }
        };
    }
}