contract Test {
    const COMPUTED: Int = 5 + 7 * 2; // expected 19

    receive() {
         let result: Int = self.COMPUTED;
    }
}
