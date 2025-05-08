struct NNN{
    a:Int;
    s:String;
    b:Bool;
    opt:Int?;
    txt:String?;
}

contract ListNNN {
    arr0: NNN;
    arr1: NNN;
    arr2: NNN;

    init() {
        self.arr0 = NNN{ a:1, s:"a", b:true, opt:null, txt:null};
        self.arr1 = NNN{ a:2, s:"b", b:false, opt:7, txt:"z"};
        self.arr2 = NNN{ a:3, s:"c", b:true, opt:null, txt:"x"};
    }
}