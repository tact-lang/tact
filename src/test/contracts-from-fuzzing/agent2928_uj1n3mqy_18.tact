struct DefaultValStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultValStructField {
    s: DefaultValStruct = DefaultValStruct{};
}