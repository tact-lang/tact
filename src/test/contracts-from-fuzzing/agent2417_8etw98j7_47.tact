struct ManyKinds {
    flag: Bool;
    optI: Int?;
    optS: String?;
    text: String;
}

contract MixedComplex {
    data: ManyKinds;

    init() {
        self.data = ManyKinds{
            flag:true,optI:null,optS:"hi",text:"there"
        };
    }
}
