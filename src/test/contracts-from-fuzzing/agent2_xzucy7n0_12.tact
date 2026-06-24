contract TestBoolValueMap {
  fun test(): Int {
    let m: map<Int, Bool> = emptyMap();
    m.set(1, true);
    m.set(2, false);
    if (m.get(1)!! != true) { return -1; }
    if (m.get(2)!! != false) { return -2; }
    return 42;
  }
}
