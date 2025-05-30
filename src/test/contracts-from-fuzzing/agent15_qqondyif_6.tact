fun multiBranchReturn(a: Bool): Int {
    if (a) { return 10; } else { return 20; }
}

fun main() {
    dump(multiBranchReturn(true));
    dump(multiBranchReturn(false));
}
