struct S1 { a: Int; b: Bool }
struct S2 { c: Int?; d: Bool? }
struct BigNested {
    x: S1;
    y: S2;
}

contract TestContract {
    val: BigNested;

    init() {
        self.val = BigNested{
            x: S1{a:5,b:true},
            y: S2{c:null,d:false}
        };
    }
}