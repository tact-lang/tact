struct StructA { x: Int; }
struct StructB { y: Int; }
struct StructC {
    sa: StructA?;
    sb: StructB?;
}

contract TestContract {
    s: StructC;

    init() {
        self.s = StructC{
            sa: StructA{x:1},
            sb: null
        };
    }
}