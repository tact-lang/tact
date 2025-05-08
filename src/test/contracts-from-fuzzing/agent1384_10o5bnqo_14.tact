struct LargeOptionStruct {
    x1: Int?; x2: Int?; x3: Int?; x4: Int?; x5: Int?;
    x6: Int?; x7: Int?; x8: Int?; x9: Int?; x10: Int?;
}

contract ManyOptionals {
    data: LargeOptionStruct;

    init() {
        self.data = LargeOptionStruct{
            x1:null,x2:null,x3:3,x4:4,x5:null,
            x6:6,x7:null,x8:8,x9:null,x10:10,
        };
    }
}