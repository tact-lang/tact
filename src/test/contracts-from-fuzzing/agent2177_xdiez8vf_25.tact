trait T1 { foo: Int }
trait T2 { bar: Bool }

contract TraitStorage with T1, T2 {
    foo: Int;
    bar: Bool;

    init() {
        self.foo = 42;
        self.bar = true;
    }
}