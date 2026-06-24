// deeply nested optionals inside structs
struct OptL3 { val: Int? }
struct OptL2 { inner: OptL3? }
struct OptL1 { inner: OptL2? }

contract Test {
    nested: OptL1;

    init() {
        self.nested = OptL1{ inner: null };
    }
}