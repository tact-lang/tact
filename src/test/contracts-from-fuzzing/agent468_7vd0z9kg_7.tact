// Struct with a huge number of fields of various types
struct HugeStruct {
    a: Int; b: Bool; c: String; d: Address; e: Cell;
    f: Int; g: Bool; h: String; i: Address; j: Cell;
    k: Int; l: Bool; m: String; n: Address; o: Cell;
    p: Int; q: Bool; r: String; s: Address; t: Cell;
    u: Int; v: Bool; w: String; x: Address; y: Cell;
    z: Int;
}

contract HugeStructTest {
    val: HugeStruct;

    init() {
        self.val = HugeStruct{
            a:1, b:true, c:"1", d:myAddress(), e:emptyCell(),
            f:2, g:false, h:"2", i:myAddress(), j:emptyCell(),
            k:3, l:true, m:"3", n:myAddress(), o:emptyCell(),
            p:4, q:false, r:"4", s:myAddress(), t:emptyCell(),
            u:5, v:true, w:"5", x:myAddress(), y:emptyCell(),
            z:6
        };
    }
}