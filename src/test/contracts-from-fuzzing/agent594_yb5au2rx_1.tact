struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    pos1: Int = 1;
    pos2: Inner = Inner{ x: 2, y: null };
}