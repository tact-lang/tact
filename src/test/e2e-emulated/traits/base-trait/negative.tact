import "./test-base-trait";

contract Reserved with TestBaseTrait {
    override const storageReserve: Int = -1;

    get fun constant(): Int {
        return self.storageReserve;
    }

    receive() {}
}