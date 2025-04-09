struct OptionalGroups {
    s1: String?;
    s2: String?;
    s3: String?;
    num1: Int?;
    num2: Int?;
    num3: Int?;
}

contract OptGroup {
    grp: OptionalGroups;

    init() {
        self.grp = OptionalGroups{
            s1:null,s2:"abc",s3:null,num1:1,num2:null,num3:3
        };
    }
}
