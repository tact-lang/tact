struct OptionalStruct {
    o1: Int?;
    o2: String?;
    o3: Bool?;
}

contract OptionalFields {
    data: OptionalStruct;
    
    init() {
        self.data = OptionalStruct{
            o1: null,
            o2: "str",
            o3: true
        };
    }
}