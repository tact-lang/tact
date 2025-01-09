primitive Int;

fun rec(): Int {
    try {
        42/0;
    } catch (rec) {  // <-- shadowing
        return rec;
    }
    return rec();
}

