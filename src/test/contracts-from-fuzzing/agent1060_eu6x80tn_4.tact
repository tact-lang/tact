struct Leaf {
    z: Bool = true;
}

struct Inner {
    a: Int = 7;
    b: Leaf?;  
}

contract Test {
    val: Inner = Inner{ b: null };
}