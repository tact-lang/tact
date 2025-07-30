struct SingleBool {
    flag: Bool;
}
contract BoolOnly {
    data: SingleBool;

    init() {
        self.data = SingleBool{ flag:true };
    }
}