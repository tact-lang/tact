// Optional persistent tuple-like struct that itself has multiple optional fields
struct Complex {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    maybeVal: Complex?;

    init() {
        self.maybeVal = null;
    }
}
