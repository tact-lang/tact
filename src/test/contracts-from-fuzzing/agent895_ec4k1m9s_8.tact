struct OptionalDeepNested1 { val: Int?; }
struct OptionalDeepNested2 { nest1: OptionalDeepNested1?; }
struct OptionalDeepNested3 { nest2: OptionalDeepNested2?; }

contract OptionalDeep {
    data: OptionalDeepNested3?;

    init() {
        self.data = OptionalDeepNested3{
            nest2: OptionalDeepNested2{
                nest1: OptionalDeepNested1{
                    val: null
                }
            }
        };
    }
}