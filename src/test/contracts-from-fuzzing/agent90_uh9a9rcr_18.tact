struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract ManyOptionalContract {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{ a:null,b:null,c:null,d:null,e:null };
    }
}