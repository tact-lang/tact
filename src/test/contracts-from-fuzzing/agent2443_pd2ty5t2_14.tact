// Deep struct tree with optional root
struct Bottom { z: Int }
struct Mid { b: Bottom }
struct Top { m: Mid }

contract TestContract {
    root: Top?;
    init() {
        self.root = null;
    }
}