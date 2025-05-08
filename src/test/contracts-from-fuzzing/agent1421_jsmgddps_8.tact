struct Struct1 {
    f1: Int;
}

struct Struct2 {
    s1: Struct1;
    optField: Int?;
}

contract StructWithInnerOptional {
    s2: Struct2 = Struct2{s1: Struct1{f1:0}, optField: null};
}