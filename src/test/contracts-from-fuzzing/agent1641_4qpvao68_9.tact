struct OptDeep {
    a: Int?;
    s: Inner?;
}

struct Inner {
    flag: Bool?;
    text: String?;
}

contract OptVeryNested {
    data: OptDeep = OptDeep{a:null, s:null};

    init() {
        self.data = OptDeep{
            a:1,
            s: Inner{flag:true, text:"hi"}
        };
    }
}