// test nested bool-only structs
struct Flags1 { a: Bool; b: Bool; }
struct Flags2 { x: Flags1; y: Flags1; }

contract Test {
    flags: Flags2;
    init() {
        self.flags = Flags2{
            x: Flags1{a: true, b: false},
            y: Flags1{a: false, b: true},
        };
    }
}