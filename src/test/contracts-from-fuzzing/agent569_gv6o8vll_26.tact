struct InnerStrOpt {
    s: String?;
}

contract StrOptInStruct {
    data: InnerStrOpt;
    init() {
        self.data = InnerStrOpt{ s:null };
    }
}