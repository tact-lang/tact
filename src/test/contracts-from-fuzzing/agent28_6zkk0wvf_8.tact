/* Test Case: Using '_' as a variable identifier in a let-binding should be rejected */

contract TestVarName {
    receive() {
         let _ = 42;
    }
}
