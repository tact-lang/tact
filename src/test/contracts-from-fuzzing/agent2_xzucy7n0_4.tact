struct MyStruct { a: Int; b: Bool; }

contract TestMapOps {
  fun test() : Int {
    let m: map<Int, MyStruct> = emptyMap();
    let s: MyStruct = MyStruct{ a: 7, b: true };
    m.set(1, s);
    let s2: MyStruct? = m.get(1);
    if (s2 == null || s2!!.a != 7 || s2!!.b != true) { return -1; }
    return 42;
  }
}
