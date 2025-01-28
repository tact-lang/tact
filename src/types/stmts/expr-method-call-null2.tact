primitive Bool;
primitive Int;

trait BaseTrait { }

extends fun foo(self: Int?): Bool {
    if (self == null) { return false }
    else { return self!! == 42 }
}

extends fun bar(self: Int?): Bool {
    if (self == null) { return false }
    else { return self!! == 69 }
}

contract Test {
    get fun test(): Bool {
        return null.foo();
    }

    get fun test2(): Bool {
        return null.bar();
    }
}
