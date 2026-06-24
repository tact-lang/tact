struct InnerRem {
    data: Slice as remaining;
}

struct OuterRem {
    someVal: Int;
    rest: InnerRem;
}

contract RemainingFieldTest {
    val: OuterRem;

    init() {
        self.val = OuterRem{
            someVal: 42,
            rest: InnerRem{
                data: "hello".asComment().asSlice()
            }
        };
    }
}