struct ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: String?;
    i: String?;
}

contract TestContract {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a:null,b:1,c:null,d:4,e:null,f:true,g:null,h:null,i:"text"
        };
    }
}
