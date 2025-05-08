/*
   TryCatchTest verifies that try-catch blocks correctly catch thrown exit codes and update persistent state.
   
   This contract is defined with a contract parameter 'f' which is mutable. In its receive() function, it deliberately throws exit code 777,
   catches it, assigns it to self.f, and then requires that self.f equals 777.
*/

contract TryCatchTest(f: Int) {
    receive() {
        try {
            throw(777);
        } catch (code) {
            self.f = code;
        }
        require(self.f == 777, "TryCatch did not catch 777");
        cashback(sender());
    }
}
