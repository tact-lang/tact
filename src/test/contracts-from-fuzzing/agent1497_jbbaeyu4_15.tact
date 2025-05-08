struct LargeMixed {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract MixedFields {
    data: LargeMixed;

    init() {
        self.data = LargeMixed{
            a:1, b:true, c:myAddress(), d:"abc",
            e:null, f:null, g:null, h:null
        };
    }
}