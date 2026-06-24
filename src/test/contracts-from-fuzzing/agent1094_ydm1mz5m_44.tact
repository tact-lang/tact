struct SomeLayer {
    a:Int;
    b:String;
    c:Bool;
    d: Int?;
    e: String?;
}

contract PerLayer {
    val: SomeLayer;
    init() {
        self.val = SomeLayer{a:1,b:"x",c:true,d:null,e:null};
    }
}