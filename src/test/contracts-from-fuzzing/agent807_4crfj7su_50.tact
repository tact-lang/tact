// test optional of struct with optional field with nested optional field
struct Inner {
    val: Int?;
}

struct Mid {
    inner: Inner?;
}

contract OptStructOptField {
    data: Mid? = null;
}