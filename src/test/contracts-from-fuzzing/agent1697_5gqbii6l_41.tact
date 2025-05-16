struct DeepOptUnicode {
    inner: InnerOpt? = null;
}

struct InnerOpt {
    s: String? = "𝌆unic🦄de☆";
}

contract TestContract {
    d: DeepOptUnicode;

    init() {
        self.d = DeepOptUnicode{};
    }
}