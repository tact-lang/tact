fun braveAndTrue() {
    try {
        throw(1042);
    }
    dump(1042);
}

fun niceCatch() {
    try {
        throw(1042);
    } catch (err) {
        dump(err);
    }
}

// Testing nested if else as per documentation
fun nestedIf() : Int {
    if (2 + 2 == 3) {
        dump("3?");
        return 1;
    } else if (2 + 2 == 4) {
        dump(true);
        return 2;
    } else {
        dump(false);
        return 3;
    }
}
