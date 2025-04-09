struct ContainsOptional {
    s: String?;
    f: Bool;
}

struct TopLevel {
    id: Int;
    data: ContainsOptional;
}

contract NestedOptional {
    t: TopLevel = TopLevel{id:42, data: ContainsOptional{s:null,f:true}};
    init() {
        self.t = TopLevel{id:7, data: ContainsOptional{s:"hi",f:false}};
    }
    receive() {}
}