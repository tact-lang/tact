struct Bar { a: Int; }

struct Foo { a: Bar; b: Bar; }

contract ManyRefs {
    val: Foo;

    init() {
        self.val = Foo{ a: Bar{a:1}, b: Bar{a:2} };
    }
}