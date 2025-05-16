/* This snippet contains multiple tests for the structs feature that are expected to compile successfully. */

// Test 1: Field reordering should not affect the resulting struct instance
struct OrderTest {
    a: Int;
    b: Int;
}

fun testFieldReordering(): Bool {
    let o1: OrderTest = OrderTest{ a: 1, b: 2 };
    let o2: OrderTest = OrderTest{ b: 2, a: 1 };
    return (o1.a == o2.a) && (o1.b == o2.b);
}

// Test 2: Default override
struct DefaultOverride {
    a: Int = 10;
    b: Int = 20;
}

fun testDefaultOverride(): Int {
    let d: DefaultOverride = DefaultOverride{ a: 99 };
    // Expected: 99 (overridden) + 20 (default) = 119
    return d.a + d.b;
}

// Test 3: All fields have default values and are omitted
struct AllDefaults {
    a: Int = 5;
    b: String = "ok";
}

fun testAllDefaults(): String {
    let ad: AllDefaults = AllDefaults{};
    return ad.b;
}

// Test 4: Nested defaults
struct Inner2 {
    x: Int = 7;
    y: Int;
}

struct Outer2 {
    inner: Inner2;
    z: Int = 100;
}

fun testNestedDefaults(): Int {
    // 'y' must be provided in Inner2
    let o: Outer2 = Outer2{ inner: Inner2{ y: 3 } };
    // Expected: inner.x (7) + inner.y (3) + z (100) = 110
    return o.inner.x + o.inner.y + o.z;
}

// Test 5: Chain conversion law (calling toCell() and fromCell() repeatedly)
struct Chain {
    a: Int;
    b: Int;
}

fun testChainConversion(): Int {
    let c: Chain = Chain{ a: 3, b: 4 };
    let c2 = Chain.fromCell(c.toCell());
    let c3 = Chain.fromCell(c2.toCell());
    return c3.a * c3.b; // Expected: 3 * 4 = 12
}

// Test 6: Trailing comma during instantiation
struct TrailingComma {
    a: Int;
    b: String;
}

fun testTrailingComma(): String {
    let t: TrailingComma = TrailingComma{ a: 10, b: "data", };
    return t.b;
}

// Test 7: Field punning with trailing comma
struct Punning2 {
    a: Int;
    b: Int;
}

fun testPunning2(): Int {
    let a: Int = 5;
    let b: Int = 7;
    let p: Punning2 = Punning2{ a, b, };
    return p.a + p.b; // Expected: 5 + 7 = 12
}

// Test 8: Nested struct instantiation (composition)
struct Base {
    a: Int = 10;
    b: Int = 2;
}

struct Derived {
    base: Base;
    c: Int;
}

fun testNestedStructs(): Int {
    let d: Derived = Derived{ base: Base{}, c: 5 };
    // Expected: 10 (from Base.a) + 2 (from Base.b) + 5 = 17
    return d.base.a + d.base.b + d.c;
}
