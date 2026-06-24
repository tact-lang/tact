struct InnerOpt {
    val: Int?;
}

struct Holder {
    inner: InnerOpt?;
    flag: Bool;
}

contract OptOptStruct {
    data: Holder;
    
    init() {
        self.data = Holder {
            inner: null,
            flag: true
        };
    }
}