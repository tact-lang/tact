primitive Int;

fun rec(rec: Int): Int { // <-- shadowing
    return rec;
}

