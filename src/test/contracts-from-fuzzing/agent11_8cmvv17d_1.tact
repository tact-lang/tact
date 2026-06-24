fun braveAndTrue() {
    try {
        throw(1042);
    }
    dump(1042);
}

fun main() {
    braveAndTrue();
}
