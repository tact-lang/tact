struct First {
    f:Int;
}

struct Second {
    f:First;
}

struct Third {
    f:Second;
}

contract ChainNested {
    f:Third;
    init(){
        self.f=Third{f:Second{f:First{f:1}}};
    }
    receive(){
        self.f.f.f.f+=1;
    }
}