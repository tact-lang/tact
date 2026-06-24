fun nestedBlockReturn(x: Int): Int {
    { 
        if (x < 0) { return 0; }
        dump(x);
    }  
    return x;
}

fun main() {
    dump(nestedBlockReturn(-5));
    dump(nestedBlockReturn(10));
    return;
}
