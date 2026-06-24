// Deep optional in contract fields
contract TestContract {
    x: Int?;
    y: Bool?;
    z: String?;
    w: Address?;
    q: Cell?;
    r: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.w = null;
        self.q = null;
        self.r = null;
    }
}