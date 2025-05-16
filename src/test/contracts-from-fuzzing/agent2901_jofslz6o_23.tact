struct PS {
    a:Int;
    b:Int;
    c:Int?;
    d:Bool;
    e:String;
}

contract Test {
    s: PS;

    init() {
        self.s = PS{a:1,b:2,c:null,d:true,e:"hi"};
    }
}