// Optional with nested optional inside struct inside optional, set topping null
struct A { a: Int?; }
struct B { b: A?; }
struct C { c: B?; }

contract OptTripleNest {
    field: C?;

    init() {
        self.field = null;
    }
}