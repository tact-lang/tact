struct TinyA { v: Int }
struct TinyB { v: Bool }
struct TinyC { v: String }

struct Combined {
    a: TinyA;
    b: TinyB;
    c: TinyC;
}

contract TinyCombTest {
    data: Combined;
    init() {
        self.data = Combined{
            a: TinyA{v:1},
            b: TinyB{v:true},
            c: TinyC{v:"x"}
        };
    }
}