struct Data {
    a: Int;
    b: Bool;
}

contract MultipleStructs {
    first: Data = Data{ a: 1, b: true };
    second: Data = Data{ a: 2, b: false };
    third: Data = Data{ a: 3, b: true };
}