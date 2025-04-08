struct MultiBool {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
}

contract TestContract {
    mb: MultiBool;
    init() {
        self.mb = MultiBool{a:true,b:null,c:false,d:true,e:false};
    }
}