struct Rec1 { a: Int; }
struct Rec2 { x: Rec1; b: Bool; }
struct Rec3 { y: Rec2; c: Int?; }
struct Rec4 { z: Rec3; d: Bool?; }

contract NestedStructs {
    data: Rec4;
    init() {
        self.data = Rec4{
            z: Rec3{
                y: Rec2{
                    x: Rec1{ a: 5 },
                    b: true,
                },
                c: null,
            },
            d: null,
        };
    }
    receive() {
        self.data = Rec4{
            z: Rec3{
                y: Rec2{
                    x: Rec1{ a: 10 },
                    b: false,
                },
                c: 100,
            },
            d: false,
        };
    }
}