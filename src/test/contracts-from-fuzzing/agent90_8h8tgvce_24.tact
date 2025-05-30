struct HasOpt {
    x: Int;
}

contract TestStorage {
    foo: HasOpt?;

    receive() { let _ = self.foo; }
}