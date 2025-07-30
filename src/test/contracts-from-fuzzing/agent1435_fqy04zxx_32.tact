contract TrailingCommaParams(
    p1: Int,
    p2: Int,
) {
    receive() { dump(self.p1 + self.p2); }
}