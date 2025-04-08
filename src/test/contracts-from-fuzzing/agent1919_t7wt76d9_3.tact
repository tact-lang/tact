struct Inner {
    flag: Bool;
    description: String?;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

contract TestContract {
    mid: Middle;
    
    init() {
        self.mid = Middle{
            inner1: Inner{flag:true, description:"abc"},
            inner2: Inner{flag:false, description:null}
        };
    }
}
