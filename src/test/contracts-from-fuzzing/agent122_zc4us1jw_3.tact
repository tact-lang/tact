struct BigStruct {
    a: Int; b: Int?; c: Bool; d: String; e: Cell; f: Slice; g: Builder; h: Address;
    i: Int; j: Int?; k: Bool; l: String; m: Cell; n: Slice; o: Builder; p: Address;
}

contract TestStorage {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1, b:null, c:true, d:"a", e:emptyCell(), f:emptyCell().asSlice(), g:beginCell(), h:myAddress(),
            i:2, j:3, k:false, l:"b", m:emptyCell(), n:emptyCell().asSlice(), o:beginCell(), p:myAddress()
        };
    }
}
