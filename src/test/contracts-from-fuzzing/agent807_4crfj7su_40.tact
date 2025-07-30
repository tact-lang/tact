// test nested optional record with a default value
struct Mini {
    foo: Int? = null;
}

contract DefOptNested {
    bar: Mini = Mini{};
}