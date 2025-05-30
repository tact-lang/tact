const GLOBAL_CONST: Int = 999;

struct A { x: Int; }

contract UsesGlobalConst {
    v: A = A{ x: GLOBAL_CONST };
}