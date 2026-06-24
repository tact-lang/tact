struct Foo {
    x: Int;
    y: String?;
    z: Bool;
}

contract TestStorage {
    fooOpt: Foo?;

    init() {
        self.fooOpt = Foo{
            x: 42,
            y: null,
            z: true
        };
    }

    receive() {
        let z = self.fooOpt;
    }
}