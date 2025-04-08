struct A { x: Int?; }
struct B { a: A?; }

contract TestNestedOpt {
    b: B?;
}