struct StructA { x: Int }
struct StructB { x: Int }
struct StructC { x: Int }
struct StructD { x: Int }
struct StructE { x: Int }
struct StructF { x: Int }
struct StructG { x: Int }
struct StructH { x: Int }

struct Complex {
    a: StructA;
    b: StructB;
    c: StructC;
    d: StructD;
    e: StructE;
    f: StructF;
    g: StructG;
    h: StructH;
}

contract VeryWide {
    val: Complex;
    init() {
        self.val = Complex{
            a: StructA{x:1}, b:StructB{x:2}, c:StructC{x:3}, d:StructD{x:4},
            e: StructE{x:5}, f:StructF{x:6}, g:StructG{x:7}, h:StructH{x:8}
        };
    }
}