struct SName {
    address: Address;
    name: String;
}

contract SNameTest {
    val: SName;
    init() {
        self.val = SName{
            address: myAddress(),
            name: "Tester"
        };
    }
}