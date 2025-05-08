contract TestContract {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    init() {}
    receive() {
        if (self.f != null) {
            let _ = self.f!!;
        }
    }
}