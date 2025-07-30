struct Mix {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Address?;
    f: Bool;
    g: String?;
    h: Address;
}

contract PersMix {
    data: Mix;

    init() {
        self.data = Mix{
            a: 10, b:"abc", c:true, d:null, e:null, f:false, g:null, h: myAddress()
        };
    }
}