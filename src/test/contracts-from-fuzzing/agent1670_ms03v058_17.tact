struct AllOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestAllOptionals {
    val: AllOptionals;
    init() {
        self.val = AllOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}
