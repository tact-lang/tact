struct NullableStruct {
    inner: InnerS?;
}

struct InnerS {
    num: Int;
    flag: Bool;
}

contract NullableStructContract {
    x: NullableStruct;

    init() {
        self.x = NullableStruct{
            inner: InnerS{
                num: 7,
                flag: false
            }
        };
    }
}