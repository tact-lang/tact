struct InnerStruct {
    val: Int?; // optional with default null
}

contract TestContract {
    optStruct: InnerStruct = InnerStruct{};
    init() {}
    receive() {}
}