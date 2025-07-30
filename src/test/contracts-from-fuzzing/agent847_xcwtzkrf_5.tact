struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
}

contract NestedBig {
    foo: BigNested;
    bar: BigNested;

    init() {
        self.foo = BigNested{ a:1,b:true,c:"x",d:null,e:false,f:"y"};
        self.bar = BigNested{ a:2,b:false,c:"z",d:5,e:true,f:"w"};
    }
}