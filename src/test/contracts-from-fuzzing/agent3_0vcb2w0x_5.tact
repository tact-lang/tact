contract TestTryNoCatch {
    fun alwaysThrow(): Int {
        try {
            throw(200);
        }
        return 0;
    }
}
