struct A {
    n: Int;
}

contract X {
    a: A = A{n: 1};
    init() {}
}

contract Y {
    a: A = A{n: 2};
    init() {}
}

// Storage of same struct in two contracts, distinct
