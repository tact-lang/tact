struct Leaf { x: Int; }
struct Mid { leaf: Leaf?; }
struct Top { mid: Mid?; }

contract DeepNulls {
    top: Top?;

    init() {
        // omit initializing top
    }
}