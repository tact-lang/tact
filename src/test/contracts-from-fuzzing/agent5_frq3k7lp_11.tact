asm fun drop(): Int { DROP }

fun underflowTest(): Int {
    repeat (5) { drop() }
    return 0;
}