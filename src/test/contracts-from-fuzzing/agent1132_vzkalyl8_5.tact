struct NestedDeeply {
    inner: Struct1;
}

struct Struct1 {
    middle: Struct2;
}

struct Struct2 {
    leaf: Struct3;   
}

struct Struct3 {
    flag: Bool;
    data: String;
}

contract DeepChain {
    tree: NestedDeeply = NestedDeeply{
        inner: Struct1{
            middle: Struct2{
                leaf: Struct3{flag: true, data: "leaf"}
            }
        }
    };
}