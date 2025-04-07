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

    receive(s: String) {
        if (s == "test \n \t \r \b \f \" \\ \v \\\\ \u{4242} \xA9") {
            self.counter += 5;
        }
    }

    get fun getCounter(): Int {
        return self.counter;
    }
}
