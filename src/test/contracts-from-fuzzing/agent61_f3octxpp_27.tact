struct ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: Int?;
    f7: Int?;
    f8: Int?;
}

contract OptionalStructManyFields {
    vals: ManyOptionals;

    init() {
        self.vals = ManyOptionals{
            f1: null, f2: null, f3:null,
            f4:null, f5:null, f6:null,
            f7:null, f8:null
        };
    }
}