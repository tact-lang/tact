import "@stdlib/deploy";

contract TextMessageReceivers with Deployable {
    counter: Int = 0;

    receive("increment'") {
        self.counter += 1;
    }

    receive("increment-2\"") {
        self.counter += 2;
    }

    receive("increment-3`") {
        self.counter += 3;
    }

    receive("\\increment-4\\") {
        self.counter += 4;
    }

    get fun getCounter(): Int {
        return self.counter;
    }
}
