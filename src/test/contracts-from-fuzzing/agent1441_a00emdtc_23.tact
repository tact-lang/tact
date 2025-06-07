struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
    f: Bool?;
    g: Int?;
    h: Address?;
}

contract StructManyOptionals {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }

    receive() {
        self.val = ManyOptionals{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:"abc",f:false,g:7,h:myAddress()
        };
    }
}