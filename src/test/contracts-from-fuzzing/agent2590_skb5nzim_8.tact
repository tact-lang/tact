struct LargeFlat {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    k: Address; l: Address; m: Address; n: Address; o: Address;
    p: Cell; q: Cell; r: Cell; s: Cell; t: Cell;
    u: Slice; v: Slice; w: Slice; x: Slice; y: Slice;
}

contract LargeFlatContract {
    data: LargeFlat;
    init() {
        self.data = LargeFlat{
            a:1,b:2,c:3,d:4,e:5,
            f:true,g:false,h:true,i:false,j:true,
            k:myAddress(),l:myAddress(),m:myAddress(),n:myAddress(),o:myAddress(),
            p:emptyCell(),q:emptyCell(),r:emptyCell(),s:emptyCell(),t:emptyCell(),
            u:emptyCell().asSlice(),v:emptyCell().asSlice(),w:emptyCell().asSlice(),x:emptyCell().asSlice(),y:emptyCell().asSlice()
        };
    }
}