contract Test(
    someMap: map<Int, Int>,
) {
    receive() {
        let _ = self.someMap.get(1);
    }
}