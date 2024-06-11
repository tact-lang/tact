import "@stdlib/deploy";

primitive Int;

trait BaseTrait { }

fun valueOf(a: Int, b: Int): Int {
    return (a + b) / 2;
}

contract SampleTactContract {
    init() {
    }
    get fun result(): Int {
        return valueOf(1, 10);
    }
}