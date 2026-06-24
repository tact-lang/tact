struct OptIntWrap { val: Int?; }
struct OptWrapWrap { wrap: OptIntWrap?; }

contract NestedWrapOptionals {
    s: OptWrapWrap = OptWrapWrap{ wrap: null };

    init() {}
}