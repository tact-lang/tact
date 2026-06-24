struct Wrap {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    data: Wrap;

    init() {
        self.data = Wrap{ optInt:null,optBool:true,optStr:null };
    }
}