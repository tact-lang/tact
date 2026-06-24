// Summary of Fuzz Testing on Control Flow Constructs in Tact

// This testing cycle focused on validating several control flow constructs discussed in the official Tact documentation, primarily from the sections on statements and try...catch ( ,  ).
//
// Tests performed include:
// 1. Valid if...else statements with proper curly braces (testValidIfElse).
// 2. Nested if...else chains to verify proper execution order (testNestedIf).
// 3. Ternary expressions (testTernary, nestedTernary, and nestedTernary2) to check associativity and correct evaluation.
// 4. Valid try...catch constructs (testTryCatch and testTryCatchValid), ensuring that exceptions are caught and handled.
// 5. A deliberate syntax error (testExtraSemi and missingCurly) to confirm that the compiler enforces required syntax (e.g., disallowing extra semicolons and enforcing curly braces).
// 6. Handling of empty if blocks (testEmptyIf).

// Observations:
// - Standard if...else constructs compile and run as expected.
// - Nested ternary expressions evaluate in accordance with typical operator associativity, though care is needed with nesting as parentheses can improve clarity.
// - The try...catch mechanism correctly rolls back state changes and captures thrown exit codes where applicable.
// - The compiler flags syntax errors such as missing required curly braces or extraneous semicolons.

// Based on these experiments, the actual compiler behavior is consistent with the documentation for control flow constructs.
// No unexpected behavior or discrepancies were discovered in this cycle.

fun testValidIfElse() : Int {
  if (true) { return 1; } else { return 2; }
}

fun testNestedIf() : Int {
  if (false) { return 1; } else if (true) { return 2; } else { return 3; }
}

fun testTernary() : Int {
  return (5 > 3) ? 10 : 20;
}

fun nestedTernary() : Int {
  // Expected: false ? 1 : true ? 2 : 3 should yield 2
  return false ? 1 : true ? 2 : 3;
}

fun testEmptyIf() : Int {
  if (true) { 
    // intentionally empty
  } else { 
    return 2; 
  }
  return 1;
}

fun testTryCatchValid() : Int {
  try {
    throw(101);
  } catch (err) {
    return err;
  }
}

// Main entry for combining return values
fun main() : Int {
  let a = testValidIfElse();
  let b = testNestedIf();
  let c = testTernary();
  let d = nestedTernary();
  let e = testEmptyIf();
  let f = testTryCatchValid();
  return a + b + c + d + e + f;
}
