struct A { x: Int; y: Bool; }
struct B { p: String; q: Int?; }
struct C { inner_a: A; inner_b: B; flag: Bool; }

contract ManyDifferentTypes {
    value: C;

    init() {
        self.value = C{
            inner_a: A{x: 5, y: true},
            inner_b: B{p: "hi", q: null},
            flag: false
        };
    }
}