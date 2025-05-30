struct MultipleSimple {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
}

struct Container {
    x: MultipleSimple;
    y: MultipleSimple;
}

contract NestedDupStructs {
    data: Container;

    init() {
        self.data = Container{
            x: MultipleSimple{a:1,b:true,c:myAddress(),d:emptyCell()},
            y: MultipleSimple{a:2,b:false,c:myAddress(),d:emptyCell()},
        };
    }
}