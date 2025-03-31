/* Test: asm function with a primitive not attached to any TVM instruction (missing TVM instruction)
   Expected: Compilation error due to stray primitive value */
asm fun missingTVM(): Int { 43 }

fun testMissingTVM(): Int {
    return missingTVM();
}
