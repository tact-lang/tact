struct StructWithManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
    g: Int?;
    h: Bool?;
    i: Int?;
    j: Bool?;
}

contract ManyOptionalsTest {
    data: StructWithManyOptionals;

    init() {
        self.data = StructWithManyOptionals{
            a:null,b:true,c:null,d:false,e:null,f:true,g:null,h:false,i:null,j:true
        };
    }
}
