struct Whitespace {
    x     :    Int    ;
    y:String?;
          z   : Bool;
}

contract OddSpacing {
    w:Whitespace;
    init(){
        self.w=Whitespace{
            x:1,y:null,z:true
        };
    }
}