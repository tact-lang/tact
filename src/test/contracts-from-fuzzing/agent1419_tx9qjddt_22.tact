struct InnerParam {
    foo: Int?;
    bar: String?;
}
contract NestedOptionalParam(
    param: InnerParam,
    x: Int
) {
    receive() {
        dump(self.param.foo);
        dump(self.param.bar);
    }
}