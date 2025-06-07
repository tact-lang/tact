trait T1 { foo: Int }
trait T2 { bar: Bool }

contract TraitInherit(
    foo: Int,
    bar: Bool,
    name: String,
) with T1, T2 {
    receive() {
        dump(self.foo);
        dump(self.bar);
        dump(self.name);
    }
}