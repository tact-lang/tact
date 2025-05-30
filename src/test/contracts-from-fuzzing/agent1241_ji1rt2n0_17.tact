struct LargeNested {
    a: Int; b: Bool; c: Int?; d: Bool?;
}

struct Container {
    one: LargeNested;
    two: LargeNested;
    three: LargeNested;
}

contract CNestFields {
    data: Container;

    init() {
        self.data = Container{
            one: LargeNested{a:1,b:true,c:null,d:false},
            two: LargeNested{a:2,b:false,c:null,d:null},
            three: LargeNested{a:3,b:true,c:99,d:true}
        };
    }
}
