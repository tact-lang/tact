struct Inner {
    x: Int;
    y: Int;
}

contract AliasTest {
    a: Inner = Inner{ x:1, y:2 };
    b: Inner = Inner{ x:3, y:4 };
    c: Int = 5;
}