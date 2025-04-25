primitive Int;
primitive Cell;
trait BaseTrait {}

contract MapLiteralMismatch {
    get fun test3(): Int {
        let x = map<Cell, Cell> {};
        return 0;
    }
}
