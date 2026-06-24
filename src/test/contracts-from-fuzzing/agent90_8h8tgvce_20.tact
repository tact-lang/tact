struct Thing {
    name: String = "abc";
    count: Int = 10;
    flag: Bool = false;
}

contract TestStorage(val: Thing) {
    receive() {
        let _ = self.val;
    }
}