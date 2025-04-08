// Deep optional chain
struct C1 { c: Int?; }
struct C2 { c: C1?; }
struct C3 { c: C2?; }
struct C4 { c: C3?; }

contract Test37 {
    data: C4;

    init() {
        self.data = C4{
            c: C3{
                c: C2{
                    c: C1{ c: 42 }
                }
            }
        };
    }
}