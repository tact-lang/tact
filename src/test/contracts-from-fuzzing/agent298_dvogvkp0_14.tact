struct S1 { f1:Int; }
struct S2 { a:S1; b:S1; }
contract DoubleStruct {
    pair: S2;
    init() {
        self.pair = S2{
            a:S1{f1:1}, b:S1{f1:2}
        };
    }
}