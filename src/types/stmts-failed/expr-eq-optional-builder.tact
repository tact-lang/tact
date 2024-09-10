primitive Bool;
primitive Builder;
trait BaseTrait {}

contract Test {
    get fun foo(s: Builder?): Bool {
        return s == s;
    }
}
