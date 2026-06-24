struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Address;
    f: Cell?;
}

contract ManyMix {
    data: Mix;

    init() {
        self.data = Mix{
            a:1,b:null,c:false,d:null,e:myAddress(),f:null
        };
    }
}
