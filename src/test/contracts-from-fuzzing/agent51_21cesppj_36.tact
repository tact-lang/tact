struct Combo {
    a:Int;
    b:Bool?;
    c:String;
    d:Int?;
    e:String?;
    f:Bool;
}

contract ComboStorage {
    val: Combo;

    init(){
        self.val = Combo{
            a:1, b:null, c:"test", d:null, e:null, f:true
        };
    }
}