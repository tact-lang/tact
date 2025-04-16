struct Opts {
    a:Int?; b:Bool?; c:String?; d:Address?; e:Cell?; f:Slice?;
}

struct Container {
    s: Opts;
    num: Int;
}

contract OptContainer {
    val: Container;
    init() {
        self.val = Container{
            s: Opts{ a:null,b:null,c:null,d:null,e:null,f:null },
            num: 123
        };
    }
}