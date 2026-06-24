// Contract with optional optional primitives (should be rejected), known issue test avoided

// Instead, test big struct with Int, Bool, String optional fields
struct Combo {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptPrims {
    val: Combo;
    init() {
        self.val = Combo{ a: null, b: true, s: null };
    }
    receive() {
        if (self.val.b != null && self.val.b!!) {
            self.val.a = 5;
        }
    }
}