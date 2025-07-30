// Deep recursive optional struct with multiple nullable branches
struct R1 { x: Int?; }
struct R2 { a: R1?; }
struct R3 { x: Int?; y: R2?; }
struct R4 { next: R3?; }

contract RecursiveOpts {
    v: R4;
    init() {
        self.v = R4{
            next: null
        };
    }
}
