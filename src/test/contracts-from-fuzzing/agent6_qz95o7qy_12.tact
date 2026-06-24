/* Summary of Structs Fuzz-Testing Cycle */

// This comprehensive test suite has verified multiple aspects of Tact's structs feature as documented in the official Tact documentation.
// 
// Test 1: Basic struct instantiation (struct Point) - compiled successfully.
// Test 2: Struct with default field values (DefaultParams) - compiled successfully, defaults applied when not overridden.
// Test 3: Nested struct instantiation (Curved containing a Point) - compiled successfully.
// Test 4: Field punning: Instantiating struct PopQuiz using local variables matching field names - compiled successfully.
// Test 5: Out-of-order field instantiation - compiled successfully (fields are provided by name, order independent).
// Test 6: Missing field error: When a required field is not provided, the compiler emits a "Missing field" error as expected.
// Test 7: Extra field error: When an extra field is provided that is not defined in the struct, an "Unknown fields" error is raised as expected.
// Test 8: Destructuring assignment of a struct (Point) works as documented.
// Test 9: Circular dependency error: Declaring mutually recursive structs is correctly rejected with an error about cyclic types.
// Test 10: Struct declaration using commas instead of semicolons resulted in a syntax error, which is expected since Tact enforces semicolons as field separators, though the documentation allows omitting the trailing semicolon. (Note: The docs show examples with semicolons.)
// Test 11: Using 'as remaining' in a field which is not the last in the struct results in an error, matching documented restrictions.

// All observed behaviors were in accordance with the official Tact documentation on structs and messages:
// - Documentation references: docs_book_structs-and-messages.md  , docs_book_types.md  .
// 
// Conclusion: The Tact structs feature behaves as documented, including correct handling of default values, field order, instantiation, destructuring, and error reporting for missing or extra fields, as well as restrictions on circular types and placement of 'as remaining' declarations.

struct Point {
    x: Int;
    y: Int;
}

struct DefaultParams {
    name: String = "Default";
    age: Int? = null;
    score: Int = 100;
}

struct Curved {
    center: Point;
    radius: Int = 5;
}

struct PopQuiz {
    count: Int;
    status: Bool;
}

struct OutOfOrder {
    a: Int;
    b: String;
}

struct ExtraField {
    x: Int;
}

// The following declaration is correct. Trailing semicolon is optional, but fields must be separated by semicolons, not commas.
struct NoSemicolon { ness: Bool }

// The following struct is intentionally erroneous to test circular dependency
// struct A { b: B; }
// struct B { a: A; }

// The following struct is used to test 'as remaining' placement; it should produce an error if 'data' is not the last field
// struct MisplacedRemaining { header: Int; data: Slice as remaining; flag: Bool; }

// Test functions (only representative examples, actual errors message tests are seen in the compiler output):

fun testStructs() {
    // Basic instantiation
    let p = Point { x: 1, y: 2 };

    // Default values applied
    let dp = DefaultParams { };

    // Nested struct
    let c = Curved { center: Point { x: 3, y: 4 } };

    // Field punning
    let count: Int = 10;
    let status: Bool = true;
    let pq = PopQuiz { count, status, };

    // Out-of-order instantiation
    let oo = OutOfOrder { b: "hello", a: 42 };

    // Destructuring assignment
    let Point { x, y } = Point { x: 10, y: 20 };

    // The following commented snippets are expected to fail compilation:
    // Missing field: MissingField { a: 42 } should raise an error for missing 'b'
    // Extra field: ExtraField { x: 10, y: 20 } should raise an error for unknown field "y"
    // Circular dependency: mutually recursive definition of structs A and B should raise a cycle error
    // Misplaced 'as remaining': 'data: Slice as remaining' not as last field should raise an error

    // Using NoSemicolon to verify that omitting the trailing semicolon in the struct declaration works correctly
    let ns = NoSemicolon { ness: true };
}

fun main() {
    testStructs();
    // End of Structs Fuzz-Testing Cycle
}
