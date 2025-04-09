fun testImmutable() : Int {
    let a = 10;
    a = a + 1;  // Attempt to reassign a let variable, should cause error
    return a;
}

asm fun asmReturn42(): Int { PUSHINT 42 }

fun callAsmReturn42() : Int {
    return asmReturn42();
}
