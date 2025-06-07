/* Testing persistent state variables using contract fields syntax
   This contract defines a persistent state variable 'x' with default 0, then sets it to 42 in init().
   It also provides a getter function getX() that returns the value of x. */

contract TestPersistent {
    x: Int = 0; // persistent state variable with default value

    init() {
        self.x = 42;
    }

    // Getter function
    fun getX(): Int {
        return self.x;
    }
}

// A dummy main function to allow compilation as an executable unit
fun main(): Int {
    // Normally, the contract would be deployed to test storage, but here we only compile.
    return 0;
}
