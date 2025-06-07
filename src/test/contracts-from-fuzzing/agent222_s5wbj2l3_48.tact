struct BigOptionStruct {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: Int?; o7: Int?; o8: Int?; o9: Int?; o10: Int?;
}

contract BigOptionals {
    f: BigOptionStruct;

    init() {
        self.f = BigOptionStruct{
            o1:null,o2:null,o3:3,o4:4,o5:5,
            o6:null,o7:7,o8:null,o9:null,o10:10
        };
    }
}