fun runPrimitives() {
    // Test primitive types
    let a: Int = 42;
    let b: Bool = true;
    let c: Cell = emptyCell();
    let s: String = "hello";
    let addr: Address = myAddress();
    dump(a);
    dump(b);
    dump(s);
    dump(addr);
}

fun main() {
    runPrimitives();
}
