primitive Int;
primitive Bool;

contract Main {
    fun f1(a: Int, b: Int): Int {
        return a + b;
    }

    fun f2(a: Int): Int {
        return self.f1(a);
    }
}