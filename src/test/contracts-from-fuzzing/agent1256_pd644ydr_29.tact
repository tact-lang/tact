struct OptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

struct ContainerOptional {
    nested: OptionalFields;
    number: Int;
    flag: Bool;
}

contract OptionalNestedField {
    data: ContainerOptional;

    init() {
        self.data = ContainerOptional{
            nested: OptionalFields{ o1:null, o2:null, o3:null },
            number: 17,
            flag: false
        };
    }
}