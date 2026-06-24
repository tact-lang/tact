struct InnerOpt {
    val: Int;
}

struct DeepOptional {
    inner: InnerOpt?;
}

contract TestDeepOptional {
    receive() {
        let d = DeepOptional { inner: InnerOpt { val: 42 } };
        if (d.inner != null) {
            let v = d.inner!!.val;
            v;
        }
    }
}
