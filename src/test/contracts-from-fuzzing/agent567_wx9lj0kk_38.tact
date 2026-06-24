// nested optional fields without init assignment (uninitialized optional contract fields)
struct Inner {
    a: Int?;
}

contract LeftBlank {
    field: Inner?;
}
