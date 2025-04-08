struct DeepParam {
    deepVal: Int;
    inner: InnerParam;
}

struct InnerParam {
    val: Int;
}

contract ParamTest(
    dp: DeepParam,
) {
    receive() {
        dump(self.dp.inner.val);
    }
}