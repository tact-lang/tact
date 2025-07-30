struct Foo {
    x: Int as coins;
    y: Int as uint64;
    z: Int as int128;
    o: Int?;
}
contract TestContract {
    foo: Foo;
    init() {
        self.foo = Foo{ x:1, y:2, z:3, o:null };
    }
}