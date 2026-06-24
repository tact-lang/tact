struct DeepOpt {
    level1: Int?; 
    level2: Int?; 
    level3: Int?; 
    level4: Int?; 
    level5: Int?;
}

contract ManyOptionals {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            level1: null, level2: null, level3: null, level4: null, level5: 42
        };
    }
}