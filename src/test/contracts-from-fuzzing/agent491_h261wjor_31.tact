// Deeply nested structs with final optional
struct End { z: Int?; }
struct Mid { y: End; }
struct Start { x: Mid; }

contract DeepOptionalEnd {
    val: Start;
    init() {
        self.val = Start{ x: Mid{ y: End{ z: null } } };
    }
}