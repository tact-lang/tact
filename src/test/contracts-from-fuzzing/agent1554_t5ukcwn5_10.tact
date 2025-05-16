struct DeeplyNestedOptionalStruct {
    foo: Int?;
}

struct Container {
    nested: DeeplyNestedOptionalStruct?;
    text: String;
    number: Int;
}

contract DeepContainerTest {
    data: Container;

    init() {
        self.data = Container{
            nested: null,
            text: "sample",
            number: 123,
        };
    }
}