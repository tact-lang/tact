primitive Bool;
primitive Int;
primitive String;

trait BaseTrait { }

extends fun foo(self: Int?): Bool {
    if (self == null) { return false }
    else { return self!! == 42 }
}

contract Test {
    get fun test(): Bool {
        return null.bar();
    }
}