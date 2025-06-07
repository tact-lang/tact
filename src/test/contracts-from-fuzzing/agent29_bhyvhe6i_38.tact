message Foo {}

contract TestContract {
    receive(f: Foo) {
        let copy = f;
        let copy2: Foo = copy;
    }
}