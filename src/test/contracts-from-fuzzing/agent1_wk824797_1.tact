fun testTryCatch() {
    try {
        throw(1042); // throw an exit code
    } catch (err) {
        dump(err);   // expected to dump 1042
    }
}
