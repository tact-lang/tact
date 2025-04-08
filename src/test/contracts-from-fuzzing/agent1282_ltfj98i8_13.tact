struct StrNest1 { s: String; }
struct StrNest2 { nest: StrNest1; }
struct StrNest3 { nest: StrNest2; }
struct StrNest4 { nest: StrNest3; }

contract StringDeepNest {
    d: StrNest4;

    init() {
        self.d = StrNest4{nest:StrNest3{nest:StrNest2{nest:StrNest1{s:"deep"}}}};
    }
}