struct A { val: Int; }
struct B { a: A; extra: Int; }
struct C { b: B; extra2: Bool; }

contract DeepMulti {
    deep: C;

    init() {
        self.deep = C{ b: B{ a: A{ val: 9 }, extra: 10 }, extra2: false };
    }
}