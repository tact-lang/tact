struct BigStruct {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice;
    g: Int; h: Bool; i: String; j: Address; k: Cell; l: Slice;
}

contract BigContainer {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            a:1,b:true,c:"a",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            g:2,h:false,i:"b",j:myAddress(),k:emptyCell(),l:emptyCell().asSlice()
        };
    }
}