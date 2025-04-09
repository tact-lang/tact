struct Rec1 { n: Int; }
struct Rec2 { s: Rec1; }
struct Rec3 { s: Rec2; }

contract OptionalMiddle {
    data: Rec3?;

    init() {
        self.data = null;
    }

    receive() {
        let _ = self.data;
    }
}