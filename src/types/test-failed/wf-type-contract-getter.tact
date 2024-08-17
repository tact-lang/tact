primitive Int;
primitive String;
trait BaseTrait {}

contract Test {
    get fun foo(): map<Int, String> {
        let m: map<Int, String> = null;
        return m;
    }
}

