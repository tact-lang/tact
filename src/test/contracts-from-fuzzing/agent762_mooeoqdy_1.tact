struct NestedOptionalStruct {
    name: String = "SampleName";
    age: Int?; 
    flag: Bool?; 
    nested: InnerStruct?;
}

struct InnerStruct {
    id: Int;
    comment: String?;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{};
    }

    receive() {
        self.data = NestedOptionalStruct{ 
            name: "Test",
            age: 42,
            flag: true,
            nested: InnerStruct{
                id: 1,
                comment: "hello"
            }
        };
    }
}