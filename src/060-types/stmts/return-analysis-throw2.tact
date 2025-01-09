primitive Int;
primitive Bool;
trait BaseTrait { }

@name(throw)
native nativeThrow(code: Int);

contract Foo {
    get fun test(c: Bool): Int {
        if (c) {
            nativeThrow(200);
        } else {
            return 42;
        }
    }
}
