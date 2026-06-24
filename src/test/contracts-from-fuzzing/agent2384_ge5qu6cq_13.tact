struct OptionalDeep {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
}

contract OptDeepTest {
    storage: OptionalDeep;
    
    init() {
        self.storage = OptionalDeep{
            level1:null,level2:null,level3:null,level4:null,level5:null
        };
    }
}