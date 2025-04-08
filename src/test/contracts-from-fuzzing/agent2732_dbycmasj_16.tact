struct MultiTypeNested {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;
}

struct Outer {
    n1: MultiTypeNested;
    n2: MultiTypeNested;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            n1: MultiTypeNested{a:1,b:true,c:myAddress(),d:emptyCell().asSlice(),e:emptyCell(),f:"x"},
            n2: MultiTypeNested{a:2,b:false,c:myAddress(),d:emptyCell().asSlice(),e:emptyCell(),f:"y"},
        };
    }
}