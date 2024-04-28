primitive Int;
primitive Bool;
trait BaseTrait { }

contract Foo {
    get fun returnInAllBranches(b: Bool, c: Bool, d: Bool): Int {
        if b {
            return 42;
        } else if c {
            return 43;
        } else if d {
            return 44;
        } else {
            return 45;
        }
    }
}
