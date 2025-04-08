struct OptionalDeep1 { next: OptionalDeep2?; }
struct OptionalDeep2 { next: OptionalDeep3?; }
struct OptionalDeep3 { next: OptionalDeep4?; }
struct OptionalDeep4 { next: OptionalDeep5?; }
struct OptionalDeep5 { x: Int?; }

contract OptChain {
    field: OptionalDeep1?;

    init() {
        self.field = null;
    }
}