// deeply nested structs without optionals
struct P1 { a: Int }
struct P2 { x: P1; y: Int }
struct P3 { q: P2; s: Int }
struct P4 { w: P3; z: Int }

contract DeepStructs {
    val: P4;

    init() {
        self.val = P4{w: P3{q: P2{x: P1{a:1}, y:2}, s:3}, z:4};
    }
}