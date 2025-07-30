struct Low {
    a:Int; b:String; c:Bool;
}

struct Mid {
    l:Low;
    opt:Int?;
}

contract Layered {
    state:Mid;

    init(){
        self.state = Mid{l: Low{a:5,b:"z",c:true}, opt:null};
    }
}