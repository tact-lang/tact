struct T {
    a: Int;
    b: Bool;
}

contract DefaultStructField {
    data: T = T{ a: 10, b: true };

    init() {}
}