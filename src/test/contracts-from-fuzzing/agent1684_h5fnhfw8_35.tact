fun constVal(): Int {
    return 777;
}

struct Foo {
    x: Int = constVal();
}

contract FuncConstFoldTest {
    v: Foo = Foo{ x: constVal() };
}