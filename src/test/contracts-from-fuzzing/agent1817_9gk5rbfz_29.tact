// Compose deeply nested optional chain (single optional chains allowed, no nested optionals)
struct A { val: Int?; }
struct B { a: A?; }
struct C { b: B?; }

contract ChainOptionals {
    c: C;

    init() {
        self.c = C{ b: null };
    }
}
