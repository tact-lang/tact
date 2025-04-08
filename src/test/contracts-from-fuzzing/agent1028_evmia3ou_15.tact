struct InnerRem {
    x: Int;
    rem1: Slice as remaining;
}

struct OuterRem {
    prefix: Int;
    nest: InnerRem;
    rem2: Slice as remaining;
}

contract MultipleRemainingFieldsTest {
    data: OuterRem;
    
    init() {
        self.data = OuterRem{
            prefix: 10,
            nest: InnerRem{
                x: 20,
                rem1: emptyCell().asSlice(),
            },
            rem2: emptyCell().asSlice(),
        };
    }
}
