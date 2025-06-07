struct A { val: Int; }
struct B { one: A; two: A; three: A; }
struct C { arr: B; str: String; flag: Bool; }

contract TestContract {
    info: C;

    init() {
        self.info = C{
            arr: B{one: A{val:1}, two:A{val:2}, three:A{val:3}},
            str: "data",
            flag: true
        };
    }
}