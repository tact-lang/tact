struct NullableMany {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    x6: Int?;
    x7: Int?;
    x8: Int?;
    x9: Int?;
    x10: Int?;
}

contract TestContract {
    info: NullableMany;

    init() {
        self.info = NullableMany{
            x1:1, x2:2, x3:null, x4:null, x5:5, x6:6, x7:7, x8:null, x9:9, x10:10 };
    }
}