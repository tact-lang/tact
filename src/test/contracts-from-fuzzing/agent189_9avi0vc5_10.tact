struct Deep {
    num: Int as uint32;
    flag: Bool?;
}

struct Middle {
    d: Deep = Deep{ num: 123456, flag: true };
    text: String = "X";
}

contract DeepNestedStructs {
    store: Middle = Middle{};
}