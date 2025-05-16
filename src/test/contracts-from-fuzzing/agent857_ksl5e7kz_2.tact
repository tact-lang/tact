struct Nested {
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: Nested = Nested{ flag: false, count: 0 };
}