contract DebugTestOpt {
    receive("debug") {
        let a: Int? = 99;
        dump(a);
        let b: Int? = null;
        dump(b);
        cashback(sender());
    }
}
