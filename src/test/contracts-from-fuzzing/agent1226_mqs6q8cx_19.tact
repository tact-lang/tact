struct Inner {
    flag: Bool;
}

contract DefaultInit {
    i: Inner = Inner{ flag: true };
}