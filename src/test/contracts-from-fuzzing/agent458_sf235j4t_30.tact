struct DefaultsStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "z";
}

contract StructDefaultInit {
    s: DefaultsStruct = DefaultsStruct{};
}