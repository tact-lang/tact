struct Opts {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: Int?;
}

contract NullableStructFields {
    data: Opts;

    init() {
        self.data = Opts{
            f1:null,f2:null,f3:null,f4:null,f5:null,f6:null
        };
    }
}