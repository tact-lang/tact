struct BigNested {
    level1: Int;
    level2: String;
    level3: Bool;
    level4: Int?;
    level5: Bool?;
    level6: String?;
}

contract ComboContract {
    f1: BigNested;
    f2: BigNested;

    init() {
        self.f1 = BigNested{
            level1: 1, level2:"L2", level3:true, level4:4, level5:false, level6:null
        };
        self.f2 = BigNested{
            level1:10, level2:"ten", level3:false, level4:null, level5:true, level6:"hello"
        };
    }
}