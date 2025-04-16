/*
Advanced Fuzz-Testing: Cells, Slices, and Extension Functions

This Tact snippet is designed to thoroughly exercise advanced features associated with cells and slices. It combines several functionalities:

1. Embedding a base64-encoded Cell via the compile-time function cell().
2. Converting the embedded Cell into a Slice and computing its depth using s.depth().
3. Constructing a new Cell that stores a uint value and a maybe-reference using storeMaybeRef().
4. Using extension functions preloadMaybeRef() and skipMaybeRef() to handle an optional Cell reference from the Slice.
5. Loading a serialized unsigned integer from the Slice after skipping the optional reference via loadUint().
6. Measuring additional metrics from the Slice such as the number of references and bits via refs() and bits().

The returned integer is a composite value computed as the sum of:
  - The depth of the first slice from the embedded Cell.
  - A flag (1 if a maybe-reference was preloaded, 0 otherwise).
  - The loaded unsigned integer from the Slice.
  - The number of references in the Slice.
  - The number of data bits in the Slice.

This test validates that:
  - The compile-time cell() function correctly embeds a Cell from a base64 string.
  - The conversion to Slice via asSlice() works properly.
  - The extension functions preloadMaybeRef() and skipMaybeRef() behave as expected.
  - The loadUint() function reads the correct value after skipping the optional reference.
  - Extension functions refs() and bits() return appropriate counts.

No known issues or documented discrepancies are repeated here; these behaviors are all within the expected functionality.

Expected behavior: The function returns a sum that reflects the proper composition of these individual computations.
*/

fun cellSliceAdvanced() : Int {
    // Embed a Cell at compile-time from a base64 encoded BoC.
    let c: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8");
    let s: Slice = c.asSlice();
    // Compute and store the depth of the slice
    let depthVal: Int = s.depth();

    // Build a new cell that stores a uint value and a maybe-reference
    let c2: Cell = beginCell().storeUint(42, 16).endCell();
    let c3: Cell = beginCell()
                  .storeMaybeRef(c2)     // Store a maybe-reference (should be non-null)
                  .storeUint(123, 16)     // Then store a uint value (123) using 16 bits
                  .endCell();
    let s2: Slice = c3.asSlice();
    
    // Preload a maybe-reference from s2. Returns a Cell if present, null otherwise.
    let maybeRef: Cell? = s2.preloadMaybeRef();
    // Skip the optional reference to position the slice for the next value
    s2.skipMaybeRef();
    // Load the uint value stored after the maybe-reference; expecting 123
    let loaded: Int = s2.loadUint(16);
    
    // Additional metrics: count of references and data bits in the current s2
    let refsCount: Int = s2.refs();
    let bitsCount: Int = s2.bits();
    
    // Combine all computed values: add 1 if maybeRef is non-null, 0 otherwise
    return depthVal + (maybeRef == null ? 0 : 1) + loaded + refsCount + bitsCount;
}

fun main() : Int {
    return cellSliceAdvanced();
}
