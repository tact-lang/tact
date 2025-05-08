struct VariousPrimitives {
    x: Int;
    y: Bool;
    z: Address;
    w: Cell;
    q: Slice;
    s: String;
}

contract TestContract {
    val: VariousPrimitives;

    init() {
        self.val = VariousPrimitives{
            x:1,y:true,z:myAddress(),w:emptyCell(),q:emptyCell().asSlice(),s:"hi"
        };
    }
}