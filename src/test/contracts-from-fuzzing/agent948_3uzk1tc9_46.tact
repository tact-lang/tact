struct ManyStructsOpt {
    s1: Int?;
    s2: Int?;
    s3: Int?;
    s4: Int?;
    s5: Int?;
}

contract LotOfOptionalsStruct {
    rec: ManyStructsOpt;

    init() {
        self.rec = ManyStructsOpt{
            s1: null,
            s2: 2,
            s3: null,
            s4: 4,
            s5: null
        };
    }
}