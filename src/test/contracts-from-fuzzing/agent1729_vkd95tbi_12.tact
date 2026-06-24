struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    x: Inner?;
    y: Inner?;
}

contract ManyOptionalsNested {
    nestedField: Outer?;
}