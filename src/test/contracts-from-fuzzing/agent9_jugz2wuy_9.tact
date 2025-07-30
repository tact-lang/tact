contract SelfTest {
    receive() {
         // Using codeOf on the current contract should be equivalent to myCode()
         let c = codeOf SelfTest;
         let m = myCode();
         // For testing, compare the two cells by converting to string (even though normally cells are not compared like this)
         // Here we just execute both calls to ensure they compile
    }
}
