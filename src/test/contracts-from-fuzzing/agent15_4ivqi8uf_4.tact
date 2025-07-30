// In this test snippet, we explore the documented claim that getter functions cannot modify state variables. However, note that while the documentation states getters may only read state variables, it is observed that state modifications done within getters are allowed at runtime (changes are just not persisted).

contract GetterTest {
    // A state variable with an initial value
    val: Int = 0;

    // Getter function: According to documentation, getters should only read state; they are not supposed to modify state variables.
    // However, in practice, the Tact compiler allows modifications here. The change to 'self.val' is done at runtime but not persisted.
    get fun modifyGetter(): Int {
        self.val = 42;   // This assignment is accepted, contrary to the strict reading of the documentation
        return self.val;
    }
}

// Since contract instantiation is handled by the blockchain environment and getters are exposed externally,
// no explicit 'main' function is provided.

// This snippet confirms that while the documentation claims that getters are read-only, the Tact compiler
// permits state modifications inside getter functions (even though such modifications are not saved on-chain).
