contract TestDebugOptionalConditional {
    receive() {
        dump(true ? 1 : null);
        dump(false ? 1 : null);
    }
}
