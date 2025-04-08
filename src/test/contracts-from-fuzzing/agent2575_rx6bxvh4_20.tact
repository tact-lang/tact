struct NestedMixed {
    x: Int;
    y: Bool?;
    z: DeepStruct;
}

struct DeepStruct {
    a: Int?;
    b: Bool;
}

contract TestContract {
    val: NestedMixed = NestedMixed{
        x: 7,
        y: null,
        z: DeepStruct{
            a: 5,
            b: false
        }
    };
}