extends fun triple(self: Int) : Int { return self * 3 }

fun test_extension() {
    let a: Int = 7;
    dump(a.triple()); // Expected: 21
}
