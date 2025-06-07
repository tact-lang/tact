struct OptionalNestedStruct {
    data: Int?;
    label: String?;
}

struct ContainerWithOptionalStruct {
    inner: OptionalNestedStruct?;
    flag: Bool;
}

contract OptionalNestedStructTest {
    val: ContainerWithOptionalStruct;

    init() {
        self.val = ContainerWithOptionalStruct{
            inner: null,
            flag: true
        };
    }
}