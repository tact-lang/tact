struct CustomSizes {
    x: Int as int64;
    y: Int as uint8;
}

contract TestContract {
    data: CustomSizes = CustomSizes{x: 123, y: 42};
}