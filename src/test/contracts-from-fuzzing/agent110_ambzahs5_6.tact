struct Bottom { x: Int; }
struct Middle { y: Bottom; }
struct Top { z: Middle; }

contract OptionalDeepNested {
    nested: Top?;

    init() {
        self.nested = null;
    }

    receive() {
        let _ = self.nested;
    }
}