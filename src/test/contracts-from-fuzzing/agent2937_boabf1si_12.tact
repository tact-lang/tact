struct OptionalStruct {
    abc: OptionalInner?;
}

struct OptionalInner {
    val: Int;
}

contract TestStructOptional {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            abc: OptionalInner{
                val: 99
            }
        };
    }
}