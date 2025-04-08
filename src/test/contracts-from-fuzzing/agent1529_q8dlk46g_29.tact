struct Combo {
    a:Int;
    b:Bool;
    c:String;
    d:Int?;
    e:String?;
}

contract ComboContract {
    c: Combo;

    init() {
        self.c = Combo{
            a:1,
            b:true,
            c:"hi",
            d:null,
            e:null
        };
    }
}
