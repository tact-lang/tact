struct MinMax { minVal: Int; maxVal: Int }

// Assembly function that pushes both a and b onto the stack and then captures them into a MinMax structure
// According to documentation, the last field (maxVal) captures the top-most value from the stack.
// The MINMAX token is expected to reorder the values appropriately.
asm fun minmax(a: Int, b: Int): MinMax { MINMAX }

fun testMinMax(): Int {
    let mm = minmax(40, 10);
    // According to documentation, mm.minVal should be the lower of the two, and mm.maxVal the higher
    // We compute a combined result for testing: e.g., min * 100 + max
    return mm.minVal * 100 + mm.maxVal;
}
