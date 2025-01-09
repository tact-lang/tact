fun testFunc(): Bool {
    let a: Bool = true;
    let b: Bool = false;
    a ||= true;
    a ||= b;
    a ||= b || true;
    a &&= true;
    a &&= b;
    a &&= b && true;
    return a;
}