// Test snippet for state inheritance via traits

trait Incrementable {
    // Declare a persistent state variable that the contract must define
    counter: Int;

    // Function to increment the counter
    fun inc() {
        self.counter = self.counter + 1;
    }
}

// The contract must include the persistent variable by defining it as contract parameter
contract Counter(counter: Int) with Incrementable {
    receive() {
        self.inc();
        dump(self.counter);
    }
}
