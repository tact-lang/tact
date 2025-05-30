struct InnerOptional {
    x: Int;
}

struct OuterOptional {
    inner: InnerOptional?;
}

contract TestOptionalStruct {
    receive() {
        let opt: OuterOptional = OuterOptional{ inner: null };
        if (opt.inner == null) {
            // branch for null, do nothing
        } else {
            // branch for non-null, do nothing
        }
    }
}
