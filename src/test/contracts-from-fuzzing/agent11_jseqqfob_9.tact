asm mutates extends fun incMutate(self: Int): Int { INC }

fun main() {
    let incremented = 10.incMutate(); // Expected output: 11
    let _dummy = incremented;
}
