primitive Int;
primitive Bool;
primitive Cell;

trait BaseTrait {
    
}

fun main() {
    let a: Int = 10;
    if (a > 0) {
        a = 10;
    } else if (a < -10) {
        a = -1;
    } else {
        a = 1;
    }
}
