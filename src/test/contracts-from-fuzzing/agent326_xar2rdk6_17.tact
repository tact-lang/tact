struct Mix {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Address;
    f: Address?;
    g: Bool;
    h: Bool?;
}

contract MixedTypes {
    m: Mix;

    init() {
        self.m = Mix{
            a:1,b:null,c:"a",d:null,e:myAddress(),f:null,g:true,h:null
        };
    }

    receive() {
        self.m = self.m;
    }
}