struct OptionalBoolIntStr {
    b: Bool?;
    i: Int?;
    s: String?;
}

contract TestContract {
    val: OptionalBoolIntStr = OptionalBoolIntStr{b:null,i:null,s:null};
}