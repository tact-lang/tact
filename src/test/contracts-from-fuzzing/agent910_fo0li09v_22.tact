struct Rec1 { x: Int; y: Bool; }
struct Rec2 { a: Rec1; b: Bool; }
struct Rec3 { d: Rec2; e: Int; }

contract NestedMix {
    state: Rec3;

    init() {
        self.state = Rec3{
            d: Rec2{
                a: Rec1{x:1,y:true},
                b: false
            },
            e: 123
        };
    }
}