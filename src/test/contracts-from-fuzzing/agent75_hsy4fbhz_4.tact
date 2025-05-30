contract Test {
    receive() {
        let s: String = "Line1\nLine2\rLine3\tEnd \\ \" \x41 \u0042 \u{43}";
    }
}
