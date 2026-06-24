struct OptInDeep1 { a: Int?; }
struct OptInDeep2 { b: OptInDeep1?; }
struct OptInDeep3 { c: OptInDeep2?; }

contract NestedOptionals {
    val: OptInDeep3;
    init() {
        self.val = OptInDeep3{
            c: OptInDeep2{
                b: OptInDeep1{a: null}
            }
        };
    }
}