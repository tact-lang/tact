primitive Address;
primitive Bool;

trait BaseTrait {}

contract Test {
    addr: Address?;

    receive() {
        if (self.addr.isNotNone()) {
            throw(10);
        }
    }
}

inline extends fun isNotNone(self: Address): Bool { return true }
