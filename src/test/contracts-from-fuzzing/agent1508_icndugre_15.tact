struct Inner {
    value: Int;
}

struct Wrapper {
    wrapped: Inner;
}

contract StructInStruct {
    innerStruct: Wrapper;

    init() {
        self.innerStruct = Wrapper{
            wrapped: Inner{
                value: 333
            }
        };
    }
}
