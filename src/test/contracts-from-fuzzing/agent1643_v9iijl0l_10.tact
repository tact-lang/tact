struct BigNested {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
}

contract BigNestedContract {
    nested1: BigNested;
    nested2: BigNested;
    nested3: BigNested;
    nested4: BigNested;

    init() {
        self.nested1 = BigNested{a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:false};
        self.nested2 = BigNested{a:5,b:false,c:6,d:true,e:7,f:false,g:8,h:true};
        self.nested3 = BigNested{a:9,b:true,c:10,d:false,e:11,f:true,g:12,h:false};
        self.nested4 = BigNested{a:13,b:false,c:14,d:true,e:15,f:false,g:16,h:true};
    }
}
