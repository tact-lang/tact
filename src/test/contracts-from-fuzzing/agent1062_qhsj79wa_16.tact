struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract UseOptionalStruct {
    data: OptionalStruct?;
    
    init() {
        self.data = OptionalStruct{
            x: 50, y: true, z: "hello"
        };
    }
}