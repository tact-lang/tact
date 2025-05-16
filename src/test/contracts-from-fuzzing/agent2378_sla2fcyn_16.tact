struct ManyOptional {
    o1: Int?; o2: Int?; o3: Bool?; o4: Bool?;
    o5: String?; o6: Address?;
}

contract ManyOptionalFields {
    data: ManyOptional;
    init() {
        self.data = ManyOptional{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
    }
}