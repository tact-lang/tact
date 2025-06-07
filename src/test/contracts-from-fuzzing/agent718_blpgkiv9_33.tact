struct NestedPrimitives {
    n1: Int;
    n2: Bool;
    n3: Address;
    n4: Cell;
    n5: String;
}

contract NestedPrimitivesContract {
    val: NestedPrimitives;
    init() {
        self.val = NestedPrimitives{
            n1:1,n2:true,n3:myAddress(),n4:emptyCell(),n5:"hi"
        };
    }
}