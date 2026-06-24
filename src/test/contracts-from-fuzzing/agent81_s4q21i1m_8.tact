contract Foo(x: Int, y: Int) {}

contract TestFoo {
    receive() {
       let s = initOf Foo(1, 2);
    }
}
