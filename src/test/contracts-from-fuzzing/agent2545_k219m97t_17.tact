struct Compose {
    i: Int;
    b: Bool?;
    s: String;
    a: Address?;
}

contract DeepCompose {
    c1: Compose;
    c2: Compose;

    init() {
        self.c1 = Compose{
            i:1,b:null,s:"abc",a:null
        };
        self.c2 = Compose{
            i:2,b:true,s:"def",a:myAddress()
        };
    }
}
