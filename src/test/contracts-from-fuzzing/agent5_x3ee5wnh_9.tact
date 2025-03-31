fun maybeThrow(v: Int) : Int {
    try {
       if (v < 0) {
             throw(42);
       }
       return v + 1;
    } catch (e) {
       return e + 2;
    }
}

fun main() : Int {
    return maybeThrow(-10);
}
