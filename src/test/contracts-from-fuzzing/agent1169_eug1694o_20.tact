struct Composite {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract MixComposite {
    val: Composite;

    init() {
        self.val = Composite{
            a:1,b:null,c:true,d:null,e:"x",f:null,g:myAddress(),h:null
        };
    }
}