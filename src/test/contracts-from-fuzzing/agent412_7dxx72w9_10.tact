contract InvalidSerializationDefault {
    smallInt: Int as uint4 = 20;

    receive() {
        let _ = self.smallInt + 1;
    }
}