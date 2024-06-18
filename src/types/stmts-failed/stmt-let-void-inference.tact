primitive Int;

trait BaseTrait {
    
}

fun foo() { return }

contract Foo {

    get fun foo(): Int {
        let voidVar = foo();
        return 42;
    }
}