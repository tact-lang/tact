struct AllOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptTest1 {
    s: AllOptional;
    
    init() {
        self.s=AllOptional{x:null,y:null,z:null};
    }
}