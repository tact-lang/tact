struct InnerStruct {
    s: String?;
    n: Int;
}

contract NestedOptionalStructContract {
    data: InnerStruct?;

    init() {
        self.data = InnerStruct{
            s: null,
            n: 42
        };
    }

    receive(){}
}