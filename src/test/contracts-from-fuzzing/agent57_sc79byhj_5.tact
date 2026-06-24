contract BlockTest {
    receive() {
        {
            let y: Int = 5;
            dump(y) // no semicolon on last statement
        }
    }
}
