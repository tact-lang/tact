struct SN {
    f1: String?;
    f2: Int?;
    f3: Bool?;
}

contract MultiStructs {
    first: SN;
    second: SN;

    init() {
        self.first = SN{ f1:null, f2:42, f3:true };
        self.second = SN{ f1:"abc", f2:null, f3:false };
    }
}