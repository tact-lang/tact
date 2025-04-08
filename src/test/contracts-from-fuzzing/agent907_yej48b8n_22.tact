struct OptInner { x: Int? }
struct OptOuter { y: OptInner? }

contract NestedOptionalStructs {
    val: OptOuter;

    init() {
        self.val = OptOuter{y:null};
    }
}