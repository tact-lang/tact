struct OptWrap {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalRecord {
    field: OptWrap;

    init() {
        self.field = OptWrap{x:null,y:null,s:null};
    }
}