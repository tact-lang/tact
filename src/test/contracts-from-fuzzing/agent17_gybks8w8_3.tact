fun nestedBlockReturn(x: Int): Int {
    { 
        if (x == 0) { 
            return 0; 
        } 
    }
    return x;
}

fun main() {
    dump(nestedBlockReturn(0)); // expected: 0
    dump(nestedBlockReturn(5)); // expected: 5
}
