struct Data {
    a: Int = 1;
    b: Bool = false;
    c: String = "foo";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    complex: Data = Data{};
}