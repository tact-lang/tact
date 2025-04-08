contract ConflictInt {
    x: Int as uint4 = 300; // 300 won't fit into uint4 (max 15)

    init() {
        self.x = 5;
    }
}