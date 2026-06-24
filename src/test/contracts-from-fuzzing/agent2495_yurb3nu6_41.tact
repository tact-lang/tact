struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract DeepOptionalsContract {
    val: DeepOptionals;

    init() {
        self.val = DeepOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}