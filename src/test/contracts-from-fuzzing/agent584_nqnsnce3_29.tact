struct OptionalWithDefaults {
    a:Int?=null;
    b:String?=null;
    c:Bool?=null;
}

contract Test {
    o:OptionalWithDefaults=OptionalWithDefaults{};
}