// Struct with optional composite
struct DeepOpt {
    inner: Maybe?
}

struct Maybe {
    val: Int?;
    val2: Int;
}

contract OptChain(
    deep: DeepOpt?,
) {
    receive() {
        let _ = (self.deep != null && self.deep!!.inner != null && self.deep!!.inner!!.val != null) ? self.deep!!.inner!!.val!! : 0;
    }
}
