fun niceCatch() {
    try {
        throw(1042); // throwing with exit code 1042
    } catch (err) {
        dump(err);       // will dump the exit code caught, which is 1042
    }
}
