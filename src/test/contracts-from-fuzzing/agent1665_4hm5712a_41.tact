// Testing optional with default assignment in contract fields
contract Broken {
    val: Int? = 1;

    init() {
        self.val = 2;
    }
}