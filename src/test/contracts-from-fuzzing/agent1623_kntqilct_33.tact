struct Massive {
    a: Int; b: Bool; c: Address; d: Cell; e: Slice;
    f: Int; g: Bool; h: Address; i: Cell; j: Slice;
    k: Int; l: Bool; m: Address; n: Cell; o: Slice;
    p: Int; q: Bool; r: Address; s: Cell; t: Slice;
    u: Int; v: Bool; w: Address; x: Cell; y: Slice;
}
contract MassStorage {
    f1: Massive;
    f2: Massive;

    init() {
        self.f1 = Massive{a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:2,g:true,h:myAddress(),i:emptyCell(),j:emptyCell().asSlice(),k:3,l:false,m:myAddress(),n:emptyCell(),o:emptyCell().asSlice(),p:4,q:true,r:myAddress(),s:emptyCell(),t:emptyCell().asSlice(),u:5,v:true,w:myAddress(),x:emptyCell(),y:emptyCell().asSlice()};
        self.f2 = Massive{a:6,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:7,g:true,h:myAddress(),i:emptyCell(),j:emptyCell().asSlice(),k:8,l:false,m:myAddress(),n:emptyCell(),o:emptyCell().asSlice(),p:9,q:true,r:myAddress(),s:emptyCell(),t:emptyCell().asSlice(),u:10,v:false,w:myAddress(),x:emptyCell(),y:emptyCell().asSlice()};
    }
}