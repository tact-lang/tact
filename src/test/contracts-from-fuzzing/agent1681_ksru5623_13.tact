struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract ComboTest {
    data: Combo;

    init() {
        self.data = Combo {
            a:1,b:true,c:"hi",d:null,
            e:null,f:null,g:null,h:null
        };
    }
}