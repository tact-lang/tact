struct S11 { a: Int; b:Bool; c:String; d:Address; e:Cell; f:Slice; g:Builder; }
struct S12 { s:S11; x:Int; y:Bool; }
contract Test18 {
    data:S12;
    init() {
        self.data = S12 {
            s: S11 { a:1, b:true, c:"x", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(), g:beginCell() },
            x: 42,
            y: false
        };
    }
}