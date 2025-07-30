contract TestSerializationFormat {
  fun test(): Int {
    let m: map<Int as uint8, Int as uint8> = emptyMap();
    m.set(2, 255);
    let v: Int? = m.get(2);
    if (v == null || v!! != 255) { return -1; }
    return 42;
  }
}
