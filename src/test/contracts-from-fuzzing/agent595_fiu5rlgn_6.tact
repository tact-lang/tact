struct ManyOptional1 {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract OptionalFieldsTest {
    m: ManyOptional1;

    init() {
        self.m = ManyOptional1{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}