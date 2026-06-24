struct Foo1 { a: Int }
struct Foo2 { a: Bool }

contract DiffStructsSameField {
    x: Foo1;
    y: Foo2;

    init() {
        self.x = Foo1{a: 10};
        self.y = Foo2{a: true};
    }
}