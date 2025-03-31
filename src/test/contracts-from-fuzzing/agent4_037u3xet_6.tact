// Fuzz-testing cycle: verifying try-catch and assembly function behavior

// 1. Test try-catch behavior
fun niceCatch() {
    try {
        throw(1042);
    } catch (err) {
        dump(err);
    }
}

// 2. Test a valid asm function that consumes a primitive correctly
asm fun answer(): Int { 42 INT }

// 3. Test an asm function with an unused primitive, which should trigger a compilation error according to documentation
// According to docs, writing "43" without being consumed by an instruction should yield error
asm fun bad(): Int { 43 }

// 4. Test an asm function with two primitives, missing an instruction to consume the first argument
asm fun missingInstruction(): Int { 42 43 }

// 5. Main function to allow executing the try-catch test
fun main() {
    niceCatch();
}
