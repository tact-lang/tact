struct Complex {
    a:Int;
    b:Bool;
    c:String;
    d:Int?;
    e:Bool?;
    f:String?;
}

contract ComplexStorage {
    val: Complex;

    init() {
        self.val = Complex{
            a:5,b:true,c:"x",d:null,e:null,f:null
        };
    }
}
