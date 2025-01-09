import "@stdlib/deploy";

contract MyContract with Deployable {
    counter: Int = 0;

    receive("increment") {
        self.counter += 1;
    }

    get fun getCounter(): Int {
        return self.counter;
    }
}