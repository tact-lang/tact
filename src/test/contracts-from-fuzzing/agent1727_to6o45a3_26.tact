struct S1 { 
    x: Int = 1; 
    y: Bool = false; 
}

struct S2 {
    s: S1 = S1{};
    z: Int = 0;
}

contract ParamStructs(
    a: Int,
    rec: S2,
) {
    receive() {
        /* noop */
    }
}