primitive Bool;
primitive Int;

trait BaseTrait { }

// Div by zero when v = 0
fun exception(v: Int): Bool {
    return 1 / v == 0;
}

contract CTest {
    A: Bool = true && exception(0);
}
