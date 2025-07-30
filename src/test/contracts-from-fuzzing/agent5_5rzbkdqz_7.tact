/// Test 6: Using both argument and return arrangements in an asm function

struct Dummy { x: Int; y: Int }

// This asm function rearranges its parameters: `c self -> 1 0` swaps the order
asm(c self -> 1 0) extends fun testArrangement2(self: Dummy, c: Int): Dummy {
    SWAP
}
