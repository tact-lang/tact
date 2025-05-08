struct BigDefault {
    x: Int = 100000000000000000000000000;
}

contract TestContract {
    big: BigDefault = BigDefault{};
}