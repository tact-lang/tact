struct NestedLong {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice; g: Int; h: Bool; i: String; j: Address;
    k: Cell; l: Slice; m: Int; n: Bool; o: String; p: Address; q: Cell; r: Slice; s: Int; t: Bool;
}

contract NestedLongFields {
    val: NestedLong;

    init() {
        self.val = NestedLong{
            a:1,b:true,c:"c",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),g:7,h:false,i:"i",j:myAddress(),
            k:emptyCell(),l:emptyCell().asSlice(),m:13,n:true,o:"o",p:myAddress(),q:emptyCell(),r:emptyCell().asSlice(),s:19,t:false
        };
    }
}