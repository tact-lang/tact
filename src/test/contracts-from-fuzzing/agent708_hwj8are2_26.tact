struct MiddleOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOpt {
    nested: MiddleOpt?;
}

contract OutOpt{
    item: OuterOpt;
    init(){
        self.item = OuterOpt{ nested: null };
    }
}