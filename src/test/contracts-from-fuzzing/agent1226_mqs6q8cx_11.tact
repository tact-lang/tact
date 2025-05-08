struct Inner {
    flag: Bool;
}

contract Test(
    innerParam: Inner,
) {
    receive() {
        dump(self.innerParam.flag);
    }
}