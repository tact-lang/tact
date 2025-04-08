struct PartialDefault {
    a: Int;
    b: Int = 5;
}

contract GoodDefault {
    p: PartialDefault = PartialDefault{ a: 12 };
}