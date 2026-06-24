struct Middle { a: Int; b: Int?; c: Bool; d: String? }
struct Outer { alpha: Int; beta: Middle; gamma: Middle }

contract NestedSiblingsOptionals {
    s: Outer;
    init() {
        self.s = Outer{
            alpha:5,
            beta: Middle{ a:1, b:null, c:true, d:"beta" },
            gamma: Middle{ a:2, b:3, c:false, d:null }
        };
    }
}