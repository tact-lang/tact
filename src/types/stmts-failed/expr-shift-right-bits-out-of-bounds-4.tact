primitive Int;
trait BaseTrait { }

fun foo(): Int {
    let a = 0;
    repeat(100) {
        a += 5;
    }
    return a;
}

contract Test {
    get fun shift(x: Int): Int {
        return x >> foo();
    }
}
