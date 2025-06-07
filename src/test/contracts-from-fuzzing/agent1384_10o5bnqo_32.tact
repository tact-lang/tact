struct StructA {
    foo: Int;
    bar: Bool;
}

contract DefaultInits {
    a: StructA = StructA{foo:1,bar:true};
    b: StructA = StructA{foo:2,bar:false};
}