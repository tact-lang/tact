contract StringTest {
    receive() {
        let s: String = "This string is too long and exceeds the maximum length that can be handled by the compiler, so I am going to see if this causes a compilation error or if it's handled gracefully.";
    }
}