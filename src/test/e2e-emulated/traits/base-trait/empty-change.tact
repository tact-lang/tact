import "./test-base-trait";

contract EmptyChange with TestBaseTrait {
    override const storageReserve: Int = 0;

    get fun constant(): Int {
        return self.storageReserve;
    }

    receive() {}
}
