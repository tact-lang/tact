primitive Int;
primitive Bool;
trait BaseTrait { }

@name(throw)
native throw(code: Int);

contract Foo {
    get fun test(c: Bool): Int {
        if (c) {
            throw(200);
        } else {
            return 42;
        }
    }
}
