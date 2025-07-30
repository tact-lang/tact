/// Test 12: Nested struct flattening

struct Inner { x: Int }
struct Outer { inner: Inner; y: Int }

// In flattened parameter, 'inner.x' becomes 'x', and 'y' remains 'y'. We use ADD to add them.
asm fun nestedAdd(o: Outer): Int { x y ADD }

fun testNested() {
    let res = nestedAdd(Outer { inner: Inner { x: 10 }, y: 15 });
}
