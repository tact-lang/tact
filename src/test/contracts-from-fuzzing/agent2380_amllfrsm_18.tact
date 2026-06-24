// large optional struct with many fields of optional types
struct ManyOptionals {
 a: Int?;
 b: Bool?;
 c: String?;
 d: Address?;
 e: Cell?;
 f: Slice?;
 g: Int?;
 h: Bool?;
 i: Int?;
 j: String?;
}

contract TestContract {
    mo: ManyOptionals?;
    init() {
        self.mo = null;
    }
}