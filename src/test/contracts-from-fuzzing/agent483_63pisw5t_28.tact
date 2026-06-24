struct AllOptional {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
}

contract AllOptTest {
    data: AllOptional;

    init() {
        self.data = AllOptional{
            x:null,y:null,z:null,addr:null
        };
    }
}
