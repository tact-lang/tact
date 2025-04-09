// Try nested struct with optional inside optionals inside optional
struct Small { x: Int?; }
struct Mid { s: Small?; }
struct Top { m: Mid?; }

contract NOptChain {
    top: Top;
    init() {
        self.top = Top{ m: null };
    }
}