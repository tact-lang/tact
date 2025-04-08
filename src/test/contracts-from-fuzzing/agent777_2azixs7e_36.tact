struct NestedMany {
    a: Int; b: Bool; c: Int?; d: Bool?;
}

struct Wrapper {
    n1: NestedMany;
    n2: NestedMany;
    n3: NestedMany;
}

contract WrapperTest {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            n1: NestedMany{a:1,b:true,c:null,d:false},
            n2: NestedMany{a:2,b:false,c:3,d:null},
            n3: NestedMany{a:4,b:true,c:5,d:true}
        };
    }
}