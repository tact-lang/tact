struct LargeNesting {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: Int?;
    i: String?;
}

struct Container {
    one: LargeNesting;
    two: LargeNesting;
    three: LargeNesting;
}

contract BigNestedStruct {
    stuff: Container;

    init() {
        self.stuff = Container{
            one: LargeNesting{ a:1,b:true,c:"x",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress(),g: null,h:null,i:null },
            two: LargeNesting{ a:2,b:false,c:"y",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress(),g: null,h:null,i:null },
            three: LargeNesting{ a:3,b:true,c:"z",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress(),g: null,h:null,i:null }
        };
    }
}