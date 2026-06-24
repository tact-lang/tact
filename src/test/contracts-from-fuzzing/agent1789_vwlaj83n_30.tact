struct A {
    x: Int?;
}

contract DefaultOptAssign {
    v: A = A{ x: null };
}