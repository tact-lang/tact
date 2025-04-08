// test optional of struct where inner field has default non-null
struct Inner {
    val: Int? = 5;
}

contract Test {
    data: Inner? = null;
}