struct OptionalLayer3 { val: Int? = null; }
struct OptionalLayer2 { ol3: OptionalLayer3? = null; }
struct OptionalLayer1 { ol2: OptionalLayer2? = null; }

contract DeepOptional {
    ol1: OptionalLayer1 = OptionalLayer1{ ol2: null };
}