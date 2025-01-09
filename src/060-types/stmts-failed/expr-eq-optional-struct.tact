primitive Bool;
primitive Int;
trait BaseTrait {}

struct S { x: Int; y: Int }

contract Test {
    get fun foo(): Bool {
        let s: S? = S {x: 42, y: 0};
        return s == s;
    }
}
