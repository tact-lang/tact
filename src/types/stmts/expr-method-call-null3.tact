primitive Bool;
primitive Int;
primitive String;

trait BaseTrait { }

extends fun foo(self: Int?): Bool {
    if (self == null) { return false }
    else { return self!! == 42 }
}

extends fun foo(self: String?): Bool {
    if (self == null) { return false }
    else { return self!! == "hello" }
}

contract Test {
    get fun test(): Bool {
        let x: Int? = null;
        return x.foo();
    }
}