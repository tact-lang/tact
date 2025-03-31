// Fuzz Testing Cycle Summary: Control Flow Constructs

// Overview:
// In this cycle, we have focused on comprehensively validating the control flow features in Tact as described in the documentation. We examined constructs related to:
// 1. Basic if...else statements (with correct use of curly braces)
// 2. Nested if...else chains
// 3. Ternary expressions and nested ternary operator behavior
// 4. try...catch constructs including rollback of state changes
// 5. Syntactical enforcement (e.g., required curly braces, handling of extra semicolons)

// Our approach involved creating multiple minimal snippets to test subtle edge cases:
// - Verifying standard if...else behavior with both true and false conditions
// - Testing nested if...else to ensure proper selection of blocks
// - Testing nested ternary expressions to infer associativity
// - Testing try...catch for proper error catching and the prevention of unreachable code
// - Confirming the enforcement of required syntax (brackets, no extra semicolons, proper condition types)

// Key Observations:
// - All valid snippets compiled successfully, and the evaluations match documented expectations.
// - The Tact compiler correctly refused code with syntax errors (e.g., missing curly braces or extraneous semicolons).
// - Try-catch behavior works as documented: thrown errors are caught and returned appropriately.

// The following snippet combines the various tested control flow constructs:

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
  // Expected result for: false ? 1 : true ? 2 : 3 is 2
  return false ? 1 : true ? 2 : 3;
}

fun testEmptyIf() : Int {
  if (true) {
    // intentionally empty block
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

// Main entry: sums up results to force evaluation
fun main() : Int {
  let a = testValidIfElse();
  let b = testNestedIf();
  let c = testTernary();
  let d = nestedTernary();
  let e = testEmptyIf();
  let f = testTryCatchValid();
  return a + b + c + d + e + f;
}

/*
Compilation and testing results indicate that:
- Standard control flow behavior adheres to the official documentation.
- Syntax errors (e.g., missing curly braces, extra semicolons) are properly identified by the compiler.
- The try...catch mechanism correctly handles thrown codes.
*/
