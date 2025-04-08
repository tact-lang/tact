// deeply nested optional fields of structs with persistent default assignments
struct A { x: Int?; }
struct B { a: A?; }
struct C { b: B?; }

contract DeepNestedOptionals {
    val: C = C{b: B{a: A{x: null}}};
}