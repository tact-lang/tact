/*
   OptionalDefaultTest verifies that an uninitialized optional (implicitly null) triggers an error
   when accessed with the non-null assertion operator (!!).
   According to the documentation, optional variables that are declared but not explicitly assigned
   hold the value null by default. Using !! on a null value should raise a runtime error.

   In this test, we assign a null optional value to a local variable opt, then use !! on it,
   catch the error, and require that the error is indeed thrown.
*/

contract OptionalDefaultTest() {
    receive() {
        let opt: Int? = null; // implicitly null
        let caught: Bool = false;
        try {
            let _ = opt!!; // should throw an error since opt is null
        } catch (code) {
            caught = true;
        }
        require(caught, "Non-null assertion on null did not throw an error");
        cashback(sender());
    }
}
