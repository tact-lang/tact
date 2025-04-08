// deep optional chain
struct SO1 { val: Int?; }
struct SO2 { val: SO1?; }
struct SO3 { val: SO2?; }

contract DeepOptionals {
    s: SO3?;
    init() {
        self.s = null;
    }
}