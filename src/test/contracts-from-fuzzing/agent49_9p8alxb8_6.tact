struct Sub {
    v: Int = 5;
}

contract Test {
    count: Int = 0;
    enabled: Bool = true;
    data: map<Int, Int>;
    nested: Sub?;
    optInt: Int?;
}
