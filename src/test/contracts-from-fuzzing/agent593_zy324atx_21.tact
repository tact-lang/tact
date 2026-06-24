// Contract with a mix of initialized and uninitialized top-level optional fields; assign in init
contract OptTopInit {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;

    init() {
        self.a = 100;
        self.b = true;
        self.c = "str";
        self.d = emptyCell().asSlice();
    }
}