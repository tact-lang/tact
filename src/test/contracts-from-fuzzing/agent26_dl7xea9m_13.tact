struct ComplexOptional {
    sub1: Int?;
    sub2: Bool?;
    sub3: String?;
}

struct LargeNested {
    part1: ComplexOptional;
    part2: ComplexOptional;
}

contract ManyOpt {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            part1: ComplexOptional{sub1:1, sub2:false, sub3:null},
            part2: ComplexOptional{sub1:null, sub2:true, sub3:"x"}
        };
    }
}