// Extended Fuzz Testing: Arrangement with Multiple Return Values

// Define a structure with three fields to test a custom return arrangement
struct Triple { a: Int; b: Int; c: Int }

// In this asm function, we push three constants onto the stack. Without arrangements, the default capture order for Triple is:
// - field c gets the topmost value (3),
// - field b gets the next (2),
// - field a gets the bottom (1).
// We now specify a custom return arrangement to reorder the values before capture.
// The arrangement '-> 2 0 1' indicates that the new order of stack values should be:
//   new_stack[0] = old_stack[2] (which is 3),
//   new_stack[1] = old_stack[0] (which is 1),
//   new_stack[2] = old_stack[1] (which is 2).
// Then, the struct fields are captured in the default right-to-left order: the last field 'c' gets the top, the middle 'b' gets the next, and 'a' gets the bottom.
// Therefore, the final captured values will be:
//   c = new_stack[2] = 2,
//   b = new_stack[1] = 1,
//   a = new_stack[0] = 3.
// So, tripleReorder() should return Triple { a: 3, b: 1, c: 2 }.

asm(-> 2 0 1) fun tripleReorder(): Triple {
    1 PUSHINT
    2 PUSHINT
    3 PUSHINT
}

fun testTriple() {
    let t: Triple = tripleReorder();
    // Expected: t.a == 3, t.b == 1, t.c == 2
    
    // Dummy usage to avoid warnings
    let _ = t;
}
