import "@stdlib/deploy";

contract Debug with Deployable {
    v: Int;
    init() {
        self.v = 0;
    }

    receive("Debug") {
        dumpStack();
        dump("Hello world!");
        dump(123);
        dump(true);
        dump(false);
        dump(null);
    }

    get fun debug() {
        dumpStack();
        dump("Hello world!");
        dump(123);
        dump(true);
        dump(false);
        dump(null);
    }
}