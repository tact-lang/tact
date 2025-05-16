struct Rec1 { a: Int; }
struct Rec2 { b: Bool; r1: Rec1; }
struct Rec3 { c: String; r2: Rec2; }
struct Rec4 { d: Address; r3: Rec3; }

contract ManyNested {
    f: Rec4;

    init() {
        self.f = Rec4{
            d: myAddress(),
            r3: Rec3{
                c: "hi",
                r2: Rec2{
                    b: true,
                    r1: Rec1{a: 1}
                }
            }
        };
    }
}
