// check large nesting + optionals with different null placements
struct L3 {
    v: Int?;
}
struct L2 {
    z: L3?;
}
struct L1 {
    y: L2?;
}

contract Test {
    x: L1?;

    init() {
        self.x = L1{
            y: null
        };
    }
}