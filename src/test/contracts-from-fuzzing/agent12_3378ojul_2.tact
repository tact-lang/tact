asm fun goodMyCode(): Cell { MYCODE }

// This should fail: TVM instructions must not be quoted.
asm fun wrongMyCode(): Cell { "MYCODE" }

fun main() {
    let a = goodMyCode();
    let b = wrongMyCode();
}
