struct DeeplyNestedOptional {
    innermost: InnermostStruct?;
}

struct InnermostStruct {
    flag: Bool;
    number: Int;
    text: String?;
}

contract ContractTest {
    field: DeeplyNestedOptional;

    init() {
        self.field = DeeplyNestedOptional{
            innermost: InnermostStruct{
                flag: true,
                number: 123,
                text: "abc"
            }
        };
    }
}