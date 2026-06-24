struct Inner {
    s: String;
    opt: Int?;
}

contract Test(
    param: Inner,
) {
    receive() {
        dump(self.param.s);
    }
}