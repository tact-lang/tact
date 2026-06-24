struct Data {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    int6: Int;
    int7: Int;
    int8: Int;
    int9: Int;
    int10: Int;
}

contract ManyInts {
    data: Data;

    init() {
        self.data = Data{
            int1: 1, int2:2, int3:3, int4:4, int5:5,
            int6:6, int7:7, int8:8, int9:9, int10:10
        };
    }
}