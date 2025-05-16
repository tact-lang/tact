struct DeepStruct {
    inner: MiddleStruct;
}

struct MiddleStruct {
    leaf: LeafStruct;
}

struct LeafStruct {
    value: Int?;
}

contract NestedStructNull {
    val: DeepStruct;

    init() {
        self.val = DeepStruct{
            inner: MiddleStruct{
                leaf: LeafStruct{
                    value: null
                }
            }
        };
    }
}