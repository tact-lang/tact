struct DeepNestLevel3 {
    val: Int;
}

struct DeepNestLevel2 {
    nest3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    nest2: DeepNestLevel2;
}

contract TestContract {
    deep: DeepNestLevel1;

    init() {
        self.deep = DeepNestLevel1{
            nest2: DeepNestLevel2{
                nest3: DeepNestLevel3{ val: 123 }
            }
        };
    }
}