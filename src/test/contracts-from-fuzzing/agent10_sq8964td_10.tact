/*
Test Suite: Comprehensive Fuzz-Testing Cycle on Tact Structs

This file contains multiple independent test cases that exercise various aspects and edge cases of struct declarations and usage in Tact.

Valid tests are included, while tests intended to trigger compile-time errors (e.g. for circular types, extra fields, or misuse of "as remaining") are commented out.

The tests below cover:
  1. Basic struct instantiation.
  2. Structs with default fields and optional types.
  3. Nested structs and destructuring assignments.
  4. Struct declarations with or without a trailing semicolon.
  5. Correct usage of the "as remaining" attribute (must be the last field).
  6. Round-trip conversion between struct and cell (using toCell() and fromCell()), implemented with an if-else statement (since inline if expressions aren’t accepted in arithmetic expressions).
  7. Field type casting with the "as" attribute.
  8. Computed default values.
  9. Custom serialization using 'as coins'.
 10. Instantiation with extra trailing commas.
 11. Named field instantiation in a different order.
 12. Structs with complex field types (Cell and optional Cell).

No unexpected compiler behavior was observed; error messages for intentionally invalid snippets match documented restrictions.
*/

// 1. Basic Struct Declaration and Instantiation
struct Point {
    x: Int;
    y: Int;
}

fun test_basic() {
    let p = Point { x: 10, y: 20 };
}

// 2. Struct with Default Fields and Optional Types
struct Params {
    name: String = "TactLang";
    age: Int?;
}

fun test_defaults() {
    let p1 = Params { name: "Alice", age: 30 };
    let p2 = Params { name: "Bob" };
}

// 3. Nested Structs and Destructuring Assignment
struct Line {
    start: Point;
    end: Point;
}

fun test_nested() {
    let line = Line {
        start: Point { x: 1, y: 2 },
        end: Point { x: 3, y: 4 }
    };
    let Point { x, y } = line.start;
    let _ = x + y; // use destructured values
}

// 4. Struct Declaration Without Trailing Semicolon
struct Mad { ness: Bool }

fun test_semicolon() {
    let m = Mad { ness: true };
}

// 5. (Invalid Test) Circular Types - Expected to Fail
// struct A {
//     b: B;
// }
//
// struct B {
//     a: A;
// }
// 
// fun test_circular() { }

// 6. (Invalid Test) Extra Field in Instantiation - Expected to Fail
// struct Foo {
//     a: Int;
// }
//
// fun test_extra_field() {
//     let f = Foo { a: 1, b: 2 };
// }

// 7. (Invalid Test) Incorrect Usage of 'as remaining' - Expected to Fail
// struct BadRemaining {
//     a: Cell as remaining;
//     b: Cell as remaining;
// }
//
// fun test_bad_remaining() {
//     let _ = BadRemaining { a: emptyCell(), b: emptyCell() };
// }

// 8. Correct Use of 'as remaining'
struct ValidRemaining {
    a: Cell;
    b: Cell as remaining;
}

fun test_valid_remaining() {
    let v = ValidRemaining { a: emptyCell(), b: emptyCell() };
}

// 9. Round-Trip Conversion with toCell() and fromCell()
// Modified to use a standard if statement instead of an inline if-expression.
struct TestStruct {
    a: Int;
    b: Bool;
}

fun test_cell_conversion() {
    let orig = TestStruct { a: 5, b: true };
    let cell = orig.toCell();
    let recons = TestStruct.fromCell(cell);
    if recons.b {
        let sum = recons.a + 1;
    } else {
        let sum = recons.a;
    }
}

// 10. Field Type Casting with 'as' Attribute
struct Casts {
    a: Int as uint8;
    b: Int as int8;
}

fun test_casts() {
    let c = Casts { a: 200, b: -10 };
    let _ = c.a + c.b;
}

// 11. Computed Default Values in Structs
struct Computed {
    a: Int = 1 + 1;
}

fun test_computed_default() {
    let c = Computed{};
}

// 12. Using Custom Serialization Type 'as coins'
struct WithCoins {
    coins: Int as coins;
}

fun test_with_coins() {
    let wc = WithCoins { coins: 1000 };
}

// 13. Instantiation with Extra Trailing Commas
struct ExtraComma {
    a: Int;
    b: Bool;
}

fun test_trailing_comma() {
    let ec = ExtraComma {
        a: 10,
        b: false,
    };
}

// 14. Named Field Instantiation in Different Order
struct OrderTest {
    a: Int;
    b: String;
}

fun test_field_order() {
    let ot = OrderTest { b: "hello", a: 99 };
}

// 15. Struct with Complex Field Types (Cell and Optional Cell)
struct CellTest {
    cellField: Cell;
    optionalCell: Cell?;
}

fun test_complex_fields() {
    let ct = CellTest { cellField: emptyCell(), optionalCell: null };
}

// End of Test Suite
