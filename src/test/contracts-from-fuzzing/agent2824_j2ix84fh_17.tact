struct NestedManyOptional {
    aa: Int?;
    bb: String?;
    cc: Bool?;
    dd: Int?;
    ee: String?;
    ff: Bool?;
    gg: Int?;
    hh: String?;
    ii: Bool?;
}

contract ManyNestedOptionalHolder {
    val: NestedManyOptional;

    init() {
        self.val = NestedManyOptional{
            aa:null, bb:null, cc:null, dd:null, ee:null,
            ff:null, gg:null, hh:null, ii:null
        };
    }
}