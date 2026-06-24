/* Test: asm function with 16 parameters (maximum allowed) that sums all parameters. 
   Parameters are automatically pushed onto the stack in order (first is bottom, last is top),
   so 15 ADD operations should combine them into the sum. 
*/

asm fun manyParams(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int, g: Int, h: Int, i: Int, j: Int, k: Int, l: Int, m: Int, n: Int, o: Int, p: Int): Int {
    ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD
}

fun main() : Int {
    // sum of 1..16 = 136
    return manyParams(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
}
