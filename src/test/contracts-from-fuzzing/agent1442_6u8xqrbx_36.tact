// contract with struct containing many optionals (mostly nulls)
struct Opts {
    a:Int?; b:Int?; c:Int?; d:Int?;
    e:Bool?; f:Bool?; g:String?; h:String?;
}
contract TestContract {
    opts: Opts;
    init() {
        self.opts = Opts{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}