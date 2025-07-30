struct Child1 { a: Int; }
struct Child2 { b: Bool; }
struct Parent {
    c1: Child1;
    c2: Child2;
}

contract StructsInStruct {
    p: Parent = Parent { c1: Child1{a:1}, c2: Child2{b:false} };
}
