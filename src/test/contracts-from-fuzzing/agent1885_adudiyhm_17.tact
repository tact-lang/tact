struct DataLevel3 {
    value: Int;
}

struct DataLevel2 {
    level3: DataLevel3;
}

struct DataLevel1 {
    level2: DataLevel2;
}

contract DeepChain {
    data: DataLevel1;

    init() {
        self.data = DataLevel1{
            level2: DataLevel2{
                level3: DataLevel3{
                    value: 777
                }
            }
        };
    }
}