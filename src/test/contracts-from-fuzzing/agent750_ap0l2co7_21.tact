struct A {
    x: Int;
    y: Bool;
}

contract DefaultsAndExplicit {
    a: A = A{x:1,y:false};
}