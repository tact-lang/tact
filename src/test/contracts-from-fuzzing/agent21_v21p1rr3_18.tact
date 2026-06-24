contract TestPow2Error {
    exp: Int;

    init() {
        // Set exp to a negative value to trigger the error
        self.exp = -1;
    }

    receive() {
        try {
            let r: Int = pow2(self.exp);
            dump(r);
        } catch (e) {
            dump(e); // Expect exit code 5: "Integer out of expected range"
        }
        return;
    }
}
