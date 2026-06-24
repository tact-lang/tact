struct Leaf { x: Int; }
struct Mid { leaf: Leaf?; }
struct Root { mid: Mid?; y: Int = 7; }

contract DeepOptNull {
    data: Root = Root{ y: 100 };
}