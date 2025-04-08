struct A {
    s: String;
}
struct B {
    a: A;
    s: String = "";
}
contract DefaultsStruct {
    data: B = B{
        a: A{ s: "" },
    };
}