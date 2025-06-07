struct Innermost { z: Int }

struct MiddleOpt {
    inner: Innermost?;
}

contract MultiOptionalAgain {
    middle: MiddleOpt?;

    init() {
        self.middle = MiddleOpt { inner: null };
    }

    receive() {
        if (self.middle != null && self.middle!!.inner != null) {
            let _ = self.middle!!.inner!!.z;
        }
    }
}