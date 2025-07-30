struct Leaf { z: Int = 1; }

struct Mid {
    l: Leaf?;
}

struct Top {
    m: Mid?;
}

contract Test {
    val: Top = Top{ m: null };
}