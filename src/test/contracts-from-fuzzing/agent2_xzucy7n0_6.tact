struct Inner { innerMap: map<Int, Int>; }

contract TestNestedMap {
  fun test() : Int {
    let outer: map<Int, Inner> = emptyMap();
    let inner: map<Int, Int> = emptyMap();
    inner.set(5, 50);
    let s: Inner = Inner { innerMap: inner };
    outer.set(1, s);
    if (outer.get(1) == null) { return -1; }
    if (outer.get(1)!!.innerMap.get(5)!! != 50) { return -2; }
    return 42;
  }
}
