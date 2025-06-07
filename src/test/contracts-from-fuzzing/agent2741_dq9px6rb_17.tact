struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract OptStructHolder {
    val: DeepOptionals;

    init() {
        self.val = DeepOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null
        };
    }
}