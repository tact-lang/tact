struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            inner: InnerStruct {
                flag: true,
                text: "hello"
            }
        };
    }
}