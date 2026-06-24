struct Ordered {
    first: Int as uint4;
    second: Int as uint256;
    third: Bool;
}

contract OrderContract {
    field: Ordered = Ordered{first: 1, second: 2, third: true};
}
