struct OptionalInDeepNest1 { n: OptionalInDeepNest2?; }
struct OptionalInDeepNest2 { n: OptionalInDeepNest3?; }
struct OptionalInDeepNest3 { n: OptionalInDeepNest4?; }
struct OptionalInDeepNest4 { z: Int?; }

contract TestOptionalInDeepNested {
    s: OptionalInDeepNest1;
    init() {
        self.s = OptionalInDeepNest1{ n: null };
    }
}