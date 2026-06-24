struct A { x: Int; y: Bool; }
struct B { a: A; optInt: Int?; }
struct C { b: B; flag: Bool; str: String; }

contract TestContract {
    field: C;

    init() {
        self.field = C{
            b: B{ a: A{ x: 3, y: true }, optInt: null },
            flag: false,
            str: "test"
        };
    }
}
