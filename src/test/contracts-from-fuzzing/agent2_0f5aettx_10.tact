/* Test 20: Valid custom arrangement with reordering all parameters
   Parameters: a, b, c; rearranged as (b, c, a) so that the stack order becomes: first -> b, then c, then a (top)
   RPN: ADD ADD will sum them: (b+c)+a
*/
asm(b c a -> 0) fun customRearrange(a: Int, b: Int, c: Int): Int { ADD ADD }

/* Test 21: Testing nested struct flattening in parameters
   Structs: Inner { x, y } and Outer { i: Inner, z: Int } are flattened as: i.x, i.y, z
   Using ADD twice: (i.x + i.y) then added with z gives total sum
*/
struct Inner { x: Int; y: Int }
struct Outer { i: Inner; z: Int }
asm fun flattenTest(o: Outer): Int { ADD ADD }

/* Test 22: Using multiple SWAP instructions; though SWAP twice is no-op, testing valid chaining
   This will push 1 and 2 and then perform SWAP, SWAP and ADD, so result should be 1+2 = 3
*/
asm fun repeatSwap(): Int { 1 PUSHINT 2 PUSHINT SWAP SWAP ADD }

/* Test 23: Using alias 'INT' instead of 'PUSHINT'
   This should compile as a valid variant of PUSHINT.
*/
asm fun aliasTest(): Int { 42 INT }

/* Test 26: Testing maximum allowed struct parameter with exactly 16 fields
   Sum all 16 integer fields using 15 ADD instructions. 
*/
struct S16 { f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; f6: Int; f7: Int; f8: Int; f9: Int; f10: Int; f11: Int; f12: Int; f13: Int; f14: Int; f15: Int; f16: Int }
asm fun sumS16(s: S16): Int { ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD }

/* Test 28: Incorrect ordering of primitive and TVM instruction arguments
   Here the intended instruction is PUSHINT with 42, but the order is reversed: argument appears after primitive name.
   Expected: compilation error.
*/
asm fun orderError(): Int { PUSHINT 42 }