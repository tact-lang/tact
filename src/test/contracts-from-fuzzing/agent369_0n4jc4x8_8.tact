struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Bool?;
    i: String?;
}

contract ManyOptionalsTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,
        };
    }
}