struct OptsMany {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Int?;
    f5: String?;
}

contract ManyOptionals {
    data: OptsMany;

    init() {
        self.data = OptsMany{
            f1:null, f2:"x", f3:true, f4:42, f5:null
        };
    }
}