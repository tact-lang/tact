struct X { i: Int }

contract InitComplex {
    x:X;
    y:String?;
    z:Bool;
    
    init(){
        self.x = X{i:1};
        self.y = null;
        self.z = true;
    }
}