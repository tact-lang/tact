struct Pair { first: Int; second: Int }

// This asm function does not modify the stack, so it will capture the initial parameters
// The arrangement '-> 1 0' swaps the two captured values such that 'first' is from s1 and 'second' from s0
asm(a b -> 1 0) fun swapReturn(a: Int, b: Int): Pair { }