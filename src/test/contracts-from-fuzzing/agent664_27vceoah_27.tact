struct Varied {
    a: Int;
    b: Bool;
    c: String?;
    d: Bool?;
    e: String;
}

contract VariedFields {
    data: Varied;

    init() {
        self.data = Varied{a:1,b:true,c:null,d:null,e:"abc"};
    }
}
