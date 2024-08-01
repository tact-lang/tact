primitive Bool;
primitive StringBuilder;
trait BaseTrait {}

contract Test {
    get fun foo(s: StringBuilder?): Bool {
        return s == s;
    }
}
