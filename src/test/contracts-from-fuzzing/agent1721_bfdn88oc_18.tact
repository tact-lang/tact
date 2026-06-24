struct OptionalDeepNested5 { val: Int?; }
struct OptionalDeepNested4 { lvl4: OptionalDeepNested5?; }
struct OptionalDeepNested3 { lvl3: OptionalDeepNested4?; }
struct OptionalDeepNested2 { lvl2: OptionalDeepNested3?; }
struct OptionalDeepNested1 { lvl1: OptionalDeepNested2?; }

contract FiveDeepOptional {
    data: OptionalDeepNested1;

    init() {
        self.data = OptionalDeepNested1{ lvl1: null };
    }
}
