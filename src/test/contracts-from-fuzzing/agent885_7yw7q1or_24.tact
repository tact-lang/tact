// test optional contract parameter with nested optionals inside struct
struct Nested {
    f1: Int?;
    f2: String?;
}

contract ParamOptTest(
    data: Nested?,
) {}
