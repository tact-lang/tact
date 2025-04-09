struct TestValid {
    m: map<Int, Int>;
}

fun main() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(42, 100);
    return m.get(42)!!;
}
