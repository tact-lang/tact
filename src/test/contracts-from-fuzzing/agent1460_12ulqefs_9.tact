struct OptionalNestedDeeper {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
}

contract TestContract {
    data: OptionalNestedDeeper;

    init() {
        self.data = OptionalNestedDeeper{ level1:null, level2:null, level3:3, level4:null, level5:5 };
    }
}