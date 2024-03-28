import "@stdlib/deploy";
import "@stdlib/ownable";

contract OwnableTransferableTest with OwnableTransferable {
    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }

    receive("test") {
        self.requireOwner();
    }
}