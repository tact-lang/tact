contract TestPrimitives {
    receive("debug") {
        dump(42);
        dump(true);
        dump("Hello, world!");
        dump(0);
        dump(false);
    }
}
