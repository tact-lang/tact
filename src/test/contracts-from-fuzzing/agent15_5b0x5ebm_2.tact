contract TestOpPrec {
    receive() {
        let five = 5;
        let four = 4;
        // Expression: five + four - five * four / five % four
        // Expected evaluation: 5 + 4 - (5 * 4 / 5) % 4 = 9
        dump(five + four - five * four / five % four);
    }
}
