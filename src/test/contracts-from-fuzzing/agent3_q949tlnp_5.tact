contract LongStringTest {
    receive() {
        let s = "This is a very long string intended to test the behavior of the Tact compiler with strings exceeding a typical short length limit that might be implicitly set by the compiler.";
    }
}