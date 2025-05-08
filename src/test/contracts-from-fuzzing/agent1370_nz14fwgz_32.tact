// A contract with persistent optional struct but without assigning in init
struct InnerOpt {
    foo: Int;
}

contract PersistOptStruct {
    bar: InnerOpt?;
}