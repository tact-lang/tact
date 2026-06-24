// Test snippet for trait OOP features (updated)

message(123) MyMsg { someVal: Int as uint8; }

trait MyTrait {
    // Abstract function: must be overridden
    abstract fun trust(msg: MyMsg);
    // Concrete function: virtual by default
    fun defaultVal(): Int {
        return 10;
    }
}

contract TestContract() with MyTrait {
    // Override the abstract method
    override fun trust(msg: MyMsg) {
        // Calculate result as msg.someVal + 1
        let result = msg.someVal + 1;
        // Call the default function through self
        let def = self.defaultVal();
        // Dump the sum
        dump(result + def);
    }

    // A receiver to trigger the test.
    receive() {
        self.trust(MyMsg{ someVal: 5 });
        dump(self.defaultVal());
    }
}
