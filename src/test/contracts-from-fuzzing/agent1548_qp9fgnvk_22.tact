// very shallow, but many optional fields
struct ManyOpts {
    a:Int?; b:Int?; c:Int?; d:Int?;
    e:Int?; f:Int?; g:Int?; h:Int?;
}

contract Test {
    v: ManyOpts;

    init() {
        self.v = ManyOpts{
            a:null,b:null,c:null,d:null,
            e:null,f:null,g:null,h:null
        };
    }
}