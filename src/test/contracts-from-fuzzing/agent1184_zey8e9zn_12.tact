struct OptionalInStruct {
    foo: Int?;
    bar: String?;
}

struct Wrapper {
    content: OptionalInStruct?;
}

contract ContainingOptionalStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            content: null
        };
    }
}