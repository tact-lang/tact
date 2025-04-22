message Foo {}

contract Test {
    receive() {}

    get fun foo(val: Foo): Foo {
        let a = val;
        return a;
    }
}
