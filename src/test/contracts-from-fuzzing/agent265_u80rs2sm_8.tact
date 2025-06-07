struct DeepOptionals {
    inner: InnerOptStruct?;
}

struct InnerOptStruct {
    value: Int?;
    text: String?;
}

contract NestedOptionals {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            inner: InnerOptStruct{
                value: null,
                text: null
            }
        };
    }

    receive() {
        self.data = self.data;
    }
}