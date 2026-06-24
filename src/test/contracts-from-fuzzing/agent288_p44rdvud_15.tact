trait MyTrait {
    owner: Address;
    flag: Bool;
}

contract Child(
    owner: Address,
    flag: Bool
) with MyTrait {
    receive() {
        require(self.flag, "");
    }
}