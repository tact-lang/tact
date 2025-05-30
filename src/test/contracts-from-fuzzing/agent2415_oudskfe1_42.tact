struct OuterWrap {
    inner1: Int?;
    inner2: String?;
    inner3: Bool?;
}

contract WrapOptAll {
    w: OuterWrap;

    init() {
        self.w = OuterWrap{
            inner1:null,
            inner2:"yo",
            inner3:true
        };
    }
}