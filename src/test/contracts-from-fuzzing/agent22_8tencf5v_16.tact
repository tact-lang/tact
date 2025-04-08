// Contract with very large persistent storage field list of optionals, primitives, nested composite
struct Info {
    val: Int;
    text: String;
    active: Bool;
}

contract SuperLargeStorage {
    a:Int?; b:String?; c:Bool?;
    d:Int?; e:String?; f:Bool?;
    g:Info?; h:Info?;
    i:Int; j:String; k:Bool;

    init() {
        self.a=null; self.b=null; self.c=null;
        self.d=null; self.e=null; self.f=null;
        self.g=null; self.h=null;
        self.i=0; self.j=""; self.k=false;
    }
}