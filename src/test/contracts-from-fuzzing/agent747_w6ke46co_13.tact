contract TestContract {
    opt: Int?;
    strct: TopStruct;

    init() {
        self.opt = null;
        self.strct = TopStruct{
            inner: InnerStruct{
                flag: false,
                txt: "txt"
            }
        };
    }
}

struct TopStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    txt: String;
}
