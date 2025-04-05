struct Foo { a: Int; }

contract Test {
    fun test() {
       let f = Foo{ a: 1 };
       let Foo { a: y, } = f;
       y;
    }
}
