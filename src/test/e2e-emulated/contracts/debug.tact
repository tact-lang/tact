import "@stdlib/deploy";

contract Debug with Deployable {

    init() {
        
    }

    receive("Debug") {
        dumpStack();
        dump("Hello world!");
        dump(123); // this comment is not included in the output
        dump(true); /* this comment is not included in the output */
        dump(false);
        dump(null);
        dump(myAddress());
        dump(newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8));
    }

    get fun debug() {
        dumpStack();
        dump("Hello world!");
        dump(123); // this comment is not included in the output
        dump(true); /* this comment is not included in the output */
        dump(false);
        dump(null);
        dump(myAddress());
        dump(newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8));
    }
}