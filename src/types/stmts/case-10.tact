import "@stdlib/deploy";
primitive Int;

trait BaseTrait { }

fun toString(): Int {
    return 123;
}

contract SampleTactContract {
    init() {
        toString();
    }
}