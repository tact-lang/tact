// Multiple persistent fields all nested optionals structs
struct A { f: Int?; }
struct B { f: Int?; }
struct C { f: Int?; }

contract ManyNestedOptFields {
    a: A?;
    b: B?;
    c: C?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}