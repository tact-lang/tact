/* Test 12: Nested struct flattening and TVM instruction usage

This test demonstrates that nested structs are properly flattened in asm functions: 
- Struct AB with fields a and b
- Struct Nested with two AB structs

The asm function mulOfSums computes (a + b of ab1) and (a + b of ab2), then multiplies them.
*/

struct AB { a: Int; b: Int }
struct Nested { ab1: AB; ab2: AB }

asm fun mulOfSums(n: Nested): Int { ADD -ROT ADD MUL }
