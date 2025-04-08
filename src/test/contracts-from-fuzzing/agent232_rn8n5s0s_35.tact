struct ManyOptionalLayers {
    a: InnerOpt1?;
    b: InnerOpt2?;
    c: InnerOpt3?;
}

struct InnerOpt1 { x: Int; }
struct InnerOpt2 { y: Bool; }
struct InnerOpt3 { s: String; }

contract MOL {
    mol: ManyOptionalLayers;

    init() {
        self.mol = ManyOptionalLayers{
            a:null, b:null, c:null
        };
    }
}