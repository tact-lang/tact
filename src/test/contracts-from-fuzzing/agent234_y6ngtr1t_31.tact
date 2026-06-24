// Struct with >20 fields, mixture of optional and various primitives
struct Huge {
 a:Int; b:Int?; c:String; d:Bool; e:String?; f:Address; g:Bool?; h:Int; i:Int?; j:Bool;
 k:String; l:Address; m:Bool; n:Int?; o:Bool?; p:Int; q:Bool; r:String?; s:Address; t:Bool;
}

contract HugeStructTest {
    st: Huge;

    init() {
        self.st = Huge{
            a:1, b:null, c:"c", d:true, e:null, f:myAddress(), g:null, h:2, i:null, j:false,
            k:"k", l:myAddress(), m:true, n:null, o:null, p:3, q:false, r:null, s:myAddress(), t:true
        };
    }
}