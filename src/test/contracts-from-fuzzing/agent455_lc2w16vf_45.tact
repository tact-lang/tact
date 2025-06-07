struct SFinal {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}
contract OptStructNulls {
    x: SFinal;

    init() {
        self.x = SFinal{f1:null,f2:null,f3:null};
    }
}