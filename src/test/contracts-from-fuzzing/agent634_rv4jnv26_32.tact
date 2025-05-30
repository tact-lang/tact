// Large nested contract persistence stress test
struct Inner1 { x: Int; y: Bool; }
struct Inner2 { a: String; b: Address; }
struct Inner3 { p: Bool?; q: Int?; }
struct Layer1 { i1: Inner1; i2: Inner2; }
struct Layer2 { l1: Layer1; i3: Inner3; }
contract HugeNestedContract {
    s: Layer2;

    init() {
        self.s = Layer2{
            l1: Layer1{
                i1: Inner1{x:1,y:true},
                i2: Inner2{a:"hi",b:myAddress()}
            },
            i3: Inner3{p:null,q:null}
        };
    }
}